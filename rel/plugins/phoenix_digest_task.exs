defmodule Burrito.PhoenixDigestTask do
  use Mix.Releases.Plugin

  def before_assembly(%Release{} = _release, _opts) do
    info "This is executed just prior to assembling the release"
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

  def after_assembly(%Release{} = release, _opts) do
    info "This is executed just after assembling, and just prior to packaging the release"
    release # or nil
  end

  def before_package(%Release{} = release, _opts) do
    info "This is executed just before packaging the release"
    release # or nil
  end

  def after_package(%Release{} = release, _opts) do
    info "This is executed just after packaging the release"
    release # or nil
  end

  def after_cleanup(_args, _opts) do
    info "This is executed just after running cleanup"
    :ok # It doesn't matter what we return here
  end
end
