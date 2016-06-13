require 'prmd/rake_tasks/combine'
require 'prmd/rake_tasks/verify'
require 'prmd/rake_tasks/doc'

namespace :schema do
  Prmd::RakeTasks::Combine.new do |t|
    t.options[:meta] = 'docs/schema/meta.json'    # use meta.yml if you prefer YAML format
    t.paths << 'docs/schema/schemata/api'
    t.output_file = 'docs/schema/api.json'
  end

  Prmd::RakeTasks::Verify.new do |t|
    t.files << 'docs/schema/api.json'
  end

  Prmd::RakeTasks::Doc.new do |t|
    t.files = { 'docs/schema/api.json' => 'docs/schema/api.md' }
  end
end

task default: ['schema:combine', 'schema:verify', 'schema:doc']
