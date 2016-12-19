# Odf(open document format)

Create `.odt`, `.ods` and `.odp` files with Ruby! For the information what is ODF please have a look at the specification [page](https://www.oasis-open.org/committees/tc_home.php).

**Note: ** This gem is still in progress and the API may change even in minor version update!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'odf'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install odf

## Usage

This gem provides 3 main classes for each document type. `Odf::Document::Text`, `Odf::Document::Spreadsheet` and `Odf::Document::Presentation`. You can instantiate any of them like so:

```ruby
document = Odf::Document::Text.new
```

After you create the document, you can add elements to it. Here we add a paragraph to our document:

```ruby
document = Odf::Document::Text.new
document.add_paragraph('Tülaay, ne olursun geri dön.')
```

For available elements you can add into your document please have a look at the `lib/element` directory.

You can also add meta information to your document like so:

```ruby
document = Odf::Document::Text.new
document.creator = 'Twentify'
```

### Serialization?

You can either serialize your document directly to file system like so: 

```ruby
document = Odf::Document::Text.new
document.serialize('path_to_serialize')
```

or get an output stream to work on it like so:

```ruby
document = Odf::Document::Text.new
document.to_blob
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/meinac/odf.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
