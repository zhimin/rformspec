require 'rubygems'
require 'rake/testtask'
require 'rake/rdoctask'

Gem::manage_gems
require 'rake/gempackagetask'

$:.unshift(File.dirname(__FILE__) + "/lib")
require 'rformunit'

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
  rdoc.title = 'rformunit'
  rdoc.template = "#{ENV['template']}.rb" if ENV['template']
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/rformunit.rb')
  rdoc.rdoc_files.include('lib/rformunit/*.rb')
}

spec = Gem::Specification.new do |s|
  s.platform= Gem::Platform::CURRENT
  s.name = "rformunit"
  s.version = "0.2.1"
  s.summary = "An wrap of AUTOIT3 for functional testing of Windows form applications"
  # s.description = ""

  s.author  = "Zhimin Zhan"
  s.email   = "zhimin@zhimin.com"
  s.homepage= "http://www.zhimin.com/software/rformunit/"
  #  s.rubyforge_project = ""

  s.has_rdoc    = true
  s.requirements << 'none'
  s.require_path    = "lib"
  s.autorequire     = "rformunit"

  s.files = [ "Rakefile", "README", "CHANGELOG", "MIT-LICENSE" ]
  #  s.files = s.files + Dir.glob( "bin/**/*" ).delete_if { |item| item.include?( "\.svn" ) }
  s.files = s.files + Dir.glob( "ext/**/*" ).delete_if { |item| item.include?( "\.svn" ) }
  s.files = s.files + Dir.glob( "lib/**/*" ).delete_if { |item| item.include?( "\.svn" ) }
  s.files = s.files + Dir.glob( "test/**/*" ).delete_if { |item| item.include?( "\.svn" ) }
  s.files = s.files + Dir.glob( "sample/**/*" ).delete_if { |item| item.include?( "\.svn" ) }
  s.files = s.files + Dir.glob( "docs/**/*" ).delete_if { |item| item.include?( "\.svn" ) }

end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.need_zip = true
end
