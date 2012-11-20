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

  describe "POST create" do
    let(:music) { mock_model(Music).as_null_object }

    before do
      Music.stub(:new).and_return(music)
    end

    it "creates a new music" do
      Music.should_receive(:new).with("title" => "Across the Universe").and_return(music)
      post :create, :music => { "title" => "Across the Universe" }
    end

    it "saves the music" do
      music.should_receive(:save)
      post :create
    end

    it "redirect to the Musics index" do
      post :create
      response.should redirect_to(:action => "index")
    end

    context "when the music saves successfully" do
      before do
        music.stub(:save).and_return(true)
      end

      it "sets a flash[:notice] music" do
        post :create
        flash[:notice].should eq("曲は追加されました。")
      end

      it "redirects to the Musics index" do
        post :create
        response.should redirect_to(:action => "index")
      end
    end

    context "when the music fails to save" do
      before do
        music.stub(:save).and_return(false)
      end

      it "assigns @music" do
        post :create
        assigns[:music].should eq(music)
      end

      it "renders the index template" do
        post :create
        response.should render_template("index")
      end
    end
  end
end
