# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'rspec', :cli => '--format Fuubar --color', :version => 2 do
  watch(%r{^spec/.+_spec\.rb$})
  # watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }

  # Rails example
  # watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  # watch(%r{^app/(.*)(\.erb|\.haml)$})                 { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
  # watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/acceptance/#{m[1]}_spec.rb"] }
  watch(%r{^lib/*.rb})  { "spec" }
  watch(%r{^lib/jeditable_wysiwyg_rails/(.+)\.rb$}) { "spec" }
  watch(%r{^lib/jeditable_wysiwyg_rails/helpers/(.+)\.rb$}) { |m| ["spec/helpers/#{m[1]}_spec.rb"] }
end
