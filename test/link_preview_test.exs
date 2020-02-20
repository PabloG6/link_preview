defmodule LinkPreviewTest do
  use LinkPreview.Case
  @valid_url "https://facebook.com"
  describe "create" do
    test "deletage to processor" do
      url = @httparrot <> "/image"
      assert LinkPreview.create(url) == LinkPreview.Processor.call(url)
    end
  end

  describe "create!" do
    test "returns Page struct" do
      assert %LinkPreview.Page{} = LinkPreview.create!(@httparrot <> "/image")
    end

    test "raise error" do
      assert_raise LinkPreview.Error, fn -> LinkPreview.create!(@httparrot <> "/robots.txt") end
    end
  end

  describe "create from google!" do
    test "returns Page struct from google" do
    assert {:ok, %LinkPreview.Page{} = _page} = LinkPreview.create(@valid_url)
    end

  end
end
