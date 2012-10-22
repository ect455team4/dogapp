require 'spec_helper'

describe PagesController do

  describe "GET 'welcome'" do
    it "returns http success" do
      get 'welcome'
      response.should be_success
    end
  describe "GET 'signin'" do
    it "returns http success" do
      get 'signin'
      response.should be_success
    end
  describe "GET 'join'" do
    it "returns http success" do
      get 'join'
      response.should be_success
    end
  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      response.should be_success
    end
  describe "GET 'contact'" do
    it "returns http success" do
      get 'contact'
      response.should be_success
    end
  end
end
