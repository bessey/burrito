defmodule Burrito.PhoenixDigestTask do
  use Mix.Releases.Plugin

  def before_assembly(%Release{} = _release) do
    info "before assembly!"
    case System.cmd("yarn", ["install"], cd: "assets/") do
      {output, 0} ->
        case System.cmd("yarn", ["run", "deploy"], cd: "assets/") do
          {output, 0} ->
            info output
            Mix.Task.run("phoenix.digest")
            nil
          {output, error_code} ->
            {:error, output, error_code}
        end
      {output, error_code} ->
        {:error, output, error_code}
    end
  end

  def after_assembly(%Release{} = _release) do
    info "after assembly!"
    nil
  end

  def before_package(%Release{} = _release) do
    info "before package!"
    nil
  end

  def after_package(%Release{} = _release) do
    info "after package!"
    nil
  end

  def after_cleanup(%Release{} = _release) do
    info "after cleanup!"
    nil
  end
end
