defmodule OurFirstApiTest.RouterTest do
  use ExUnit.Case, async: true

  use Plug.Test

  @opts  OurFirstApi.Router.init([])

  test "return ok" do
    build_conn = conn(:get,"/")
    conn = OurFirstApi.Router.call(build_conn, @opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "OK"
  end

  test "return names" do
    build_conn = conn(:get,"/names")
    conn = OurFirstApi.Router.call(build_conn, @opts)

    assert conn.state == :sent
    assert conn.status == 300
    assert conn.resp_body == " KGOTSO SIPHO CHRIX"
  end

end
