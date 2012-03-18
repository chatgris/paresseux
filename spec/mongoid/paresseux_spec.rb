# encoding: utf-8
require "spec_helper"

class Article
  VERSION = 2

  include Mongoid::Document
  include Mongoid::Paresseux

  field :title, type: String
  field :slug,  type: String
end

class ArticleParesseux < Paresseux::Migration
  def migration_1_to_2
    model.slug = model.title.parameterize
  end
end

describe Mongoid::Paresseux do

  context 'old version' do
    let(:article) { Article.create title: "New title"}

    before do
      article.paresseux_version = 1
      ArticleParesseux.new(article, 2).migrate!
    end

    it 'should have update slug' do
      article.slug.should eq 'new-title'
    end

    it 'should have update version' do
      article.paresseux_version.should eq 2
    end

    it 'should not rerun migration' do
      article.reload
      article.title = "New version"
      article.save
      article.reload.slug.should eq 'new-title'
    end
  end

  context 'new version' do
    let(:article) { Article.create title: "New version"}

    it 'should be at version 2' do
      article.reload.paresseux_version.should eq 2
    end

    it 'should not have run migration' do
      article.reload.slug.should be_nil
    end
  end
end
