require 'rake/clean'
require 'rspec/core/rake_task'

$accounts_dir = 'accounts'
$report_dir = 'reports'

desc "Run all tests."
task :all => [:ut, :at]
task :temp_dirs => [$accounts_dir, $report_dir]

directory $accounts_dir
directory $report_dir

CLEAN.include $accounts_dir, $report_dir

desc "Run acceptance tests."
task :at => [:temp_dirs] do
    sh "pybot -d #{$report_dir} atest"
end
task :default => [:at]

task :ut => [:temp_dirs]
desc "Run unit tests."
RSpec::Core::RakeTask.new(:ut) do |spec|
    spec.pattern = ["unit"]
    spec.rspec_opts = [
        "--color",
        "--format documentation",
        ]
end

namespace "server" do
    desc "Run the server in the background."
    task :bg => [:temp_dirs] do
        %x{ruby app/server.rb -p 4567 &> reports/server.log &}
    end
    desc "Run the server in the foreground."
    task :fg => [:temp_dirs] do
        %x{ruby app/server.rb  -p 4567 &> reports/server.log}
    end
end

