# Specs
require 'spec/rake/spectask'

desc 'Run specifications'
Spec::Rake::SpecTask.new(:spec => [ :clean, :compile ]) do |t|
  t.spec_opts << '--options' << ROOT + 'spec/spec.opts'
  t.spec_files = Pathname.glob(ENV['FILES'] || 'spec/**/*_spec.rb').map { |f| f.to_s }
  t.libs << 'lib'

  begin
    # RCov is run by default, except on the JRuby and IronRuby platforms
    t.rcov = JRUBY || IRONRUBY ? false : (ENV.has_key?('NO_RCOV') ? ENV['NO_RCOV'] != 'true' : true)
    t.rcov_opts << '--exclude' << 'spec'
    t.rcov_opts << '--text-summary'
    t.rcov_opts << '--sort' << 'coverage' << '--sort-reverse'
  rescue Exception
    # rcov not installed
  end
end
