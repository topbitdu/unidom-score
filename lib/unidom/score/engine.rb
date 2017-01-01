module Unidom
  module Score

    class Engine < ::Rails::Engine

      include Unidom::Common::EngineExtension

      isolate_namespace Unidom::Score

      enable_initializer enum_enabled: false, migration_enabled: true

    end

  end
end
