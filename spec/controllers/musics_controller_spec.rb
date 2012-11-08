# coding: utf-8
require 'spec_helper'

describe MusicsController do
  before do
  end
  describe "GET /musics" do
    it "should be successfull" do
      get 'index'
      response.should be_success
    end
  end
end
