# Tempbucket

Temporary files stored on S3

## Installation

Add this line to your application's Gemfile:

    gem 'tempbucket'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tempbucket

## Usage

Set up your environment

* ENV["TEMPBUCKET_BUCKET"]
* ENV["TEMPBUCKET_ACCESS_KEY_ID"]
* ENV["TEMPBUCKET_SECRET_ACCESS_KEY"]

Store a tempfile in S3

    t = Tempbucket.new
    tempfile = t.write(file)
    MyWorker.enqueue(tempfile.key)

Recover it later

    t = Tempbucket.new
    tempfile = t.read(key)
    MyWorker.new.perform(tempfile)

Destroy it

    tempfile.close

## Contributing

1. Fork it ( https://github.com/matthewrudy/tempbucket/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
