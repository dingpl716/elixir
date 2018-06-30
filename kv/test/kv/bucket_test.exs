defmodule KV.BucketTest do
  # this makes the test case run in parallel
  use ExUnit.Case, async: true

  setup do
    {:ok, bucket} = KV.Bucket.start_link([])
    %{bucket_key: bucket}
  end

  test "stores values by key", %{bucket_key: bucket} do
    assert KV.Bucket.get(bucket, "milk") == nil
    KV.Bucket.put(bucket, "milk", 3)
    assert KV.Bucket.get(bucket, "milk") === 3
  end

  test "bucket should be empty after creation", %{bucket_key: bucket} do
    assert KV.Bucket.bucket_length(bucket) === 0
  end

  test "delete key from bucket", %{bucket_key: bucket} do
    key = "milk"
    val = 3
    assert KV.Bucket.get(bucket, key) == nil

    KV.Bucket.put(bucket, key, val)
    assert KV.Bucket.get(bucket, key) === val

    KV.Bucket.delete(bucket, key)
    assert KV.Bucket.get(bucket, key) == nil
  end

  test "are temporary workers" do
    assert Supervisor.child_spec(KV.Bucket, []).restart == :temporary
  end
end
