# coding: utf-8
require 'spec_helper'

describe MainmenuController do
  before do
  end
  describe "GET /mainmenu_index" do
    it "should be successfull" do
      get 'index'
      response.should be_success
    end
  end
end
