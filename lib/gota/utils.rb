module Gota
  module Volume
    # * UTILS
    class Utils
      def which?(executable)
        ENV['PATH'].split(File::PATH_SEPARATOR).any? do |directory|
          File.executable?(File.join(directory, executable.to_s))
        end
      end
    end
  end
end
