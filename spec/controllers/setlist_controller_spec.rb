# coding: utf-8
require 'spec_helper'

describe SetlistController do
  before do
  end

  describe "GET /setlist_index" do
    it "should be successfull" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET /make_setlist_index" do
    it "should be successfull" do
      get 'make'
      response.should be_success
    end
  end

end
