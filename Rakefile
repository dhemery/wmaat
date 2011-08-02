require 'rake/clean'
require 'rspec/core/rake_task'

$atest_dir = 'atest'
$accounts_dir = 'accounts'
$report_dir = 'reports'

directory $accounts_dir
directory $report_dir
directory $atest_dir

$temp_dirs = $atest_dir, $accounts_dir, $report_dir
CLEAN.include $temp_dirs

desc "Run all tests."
task :all => [:ut, :at]
task :temp_dirs => $temp_dirs


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

desc "These tasks copy example tests into the atest dir, ready to run"
namespace "init" do
    desc "Ugly tests (start here)"
    task :ugly => [:clean] do
        sh "cp -r examples/0-ugly-tests #{$atest_dir}"
    end

    desc "Step 1: Hide incidentals"
    task :incidentals => [:clean] do
        sh "cp -r examples/1-hide-incidentals #{$atest_dir}"
    end

    desc "Step 2: Remove duplication"
    task :duplication => [:clean] do
        sh "cp -r examples/2-remove-duplication #{$atest_dir}"
    end

    desc "Step 3: Name important values"
    task :values => [:clean] do
        sh "cp -r examples/3-name-important-values #{$atest_dir}"
    end

    desc "Step 4: Name key concepts"
    task :concepts => [:clean] do
        sh "cp -r examples/4-name-key-concepts #{$atest_dir}"
    end

    desc "Step 5: Organize the code"
    task :organize => [:clean] do
        sh "cp -r examples/5-organize-code #{$atest_dir}"
    end

    desc "Step 6: Change to a new technology"
    task :web => [:clean] do
        sh "cp -r examples/6-change-technology #{$atest_dir}"
    end
end
