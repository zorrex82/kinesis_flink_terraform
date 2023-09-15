from pyflink.table import StreamTableEnvironment
from pyflink.table.environment_settings import EnvironmentSettings

st_env = StreamTableEnvironment.create(
    environment_settings=EnvironmentSettings.new_instance()
    .in_streaming_mode()
    .use_blink_planner()
    .build()
)
