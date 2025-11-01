-- Disable audio device suspension to prevent dropouts
rule = {
  matches = {
    {
      { "node.name", "matches", "alsa_output.*" },
    },
    {
      { "node.name", "matches", "alsa_input.*" },
    },
  },
  apply_properties = {
    ["session.suspend-timeout-seconds"] = 0,
  },
}

table.insert(alsa_monitor.rules, rule)
