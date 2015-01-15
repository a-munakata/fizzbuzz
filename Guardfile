# More info at https://github.com/guard/guard#readme
# https://github.com/guard/guard/wiki/Understanding-Guard

directories %w(spec lib)

guard :rspec, cmd: "bundle exec rspec" do
  watch(%r{^spec/(.+)\.rb})
  watch(%r{^lib/(.+)\.rb}) { |m| "spec/#{m[1]}_spec.rb" }
end

guard :rubocop, cmd: "bundle exec rubocop" do
  watch(%r{^spec/(.+)\.rb})
  watch(%r{^lib/(.+)\.rb})
end
