require 'rubygems'
require 'rake/testtask'
require 'rdoc/task'
require 'rubygems/package_task'

$:.unshift(File.dirname(__FILE__) + "/lib")
require 'rformspec'

desc "Default task"
task :default => [ :clean, :test , :gem]

desc "Clean generated files"
task :clean do
  rm_rf 'pkg'
  rm_rf 'docs/rdoc'
end

# run the unit tests
Rake::TestTask.new("test") { |t|
  t.test_files = FileList['test/test*.rb']
  t.verbose= true
}


# Generate the RDoc documentation
Rake::RDocTask.new { |rdoc|
  rdoc.rdoc_dir = 'docs/rdoc'
  rdoc.title = 'rformspec'
  rdoc.template = "#{ENV['template']}.rb" if ENV['template']
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/rformspec.rb')
  rdoc.rdoc_files.include('lib/rformspec/*.rb')
}

spec = Gem::Specification.new do |s|
  s.platform= Gem::Platform::CURRENT
  s.name = "rformspec"
  s.version = "0.5.2"
  s.summary = "An wrap of AUTOIT3 for functional testing of Windows form applications"
  # s.description = ""

  s.author  = "Zhimin Zhan"
  s.email   = "zhimin@agileway.com.au"
  s.homepage= "http://github.com/zhimin/rformspec"
  #  s.rubyforge_project = ""

  s.has_rdoc    = true
  s.requirements << 'none'
  s.require_path    = "lib"
  s.autorequire     = "rformspec"

  s.files = [ "Rakefile", "README", "CHANGELOG", "MIT-LICENSE" ]
  #  s.files = s.files + Dir.glob( "bin/**/*" ).delete_if { |item| item.include?( "\.svn" ) }
  s.files = s.files + Dir.glob( "ext/**/*" ).delete_if { |item| item.include?( "\.svn" ) }
  s.files = s.files + Dir.glob( "lib/**/*" ).delete_if { |item| item.include?( "\.svn" ) }
  s.files = s.files + Dir.glob( "test/**/*" ).delete_if { |item| item.include?( "\.svn" ) }
  s.files = s.files + Dir.glob( "sample/**/*" ).delete_if { |item| item.include?( "\.svn" ) }
  s.files = s.files + Dir.glob( "docs/**/*" ).delete_if { |item| item.include?( "\.svn" ) }

end

Gem::PackageTask.new(spec) do |pkg|
  pkg.need_zip = true
end
