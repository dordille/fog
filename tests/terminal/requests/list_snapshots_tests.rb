Shindo.tests('Fog::Compute[:terminal] | list_snapshots request', ['terminal', 'compute']) do

  # {"id"=>1601, "name"=>"CentOS 5.8 x64", "distribution"=>"CentOS"}
  @snapshot_format = {
    "id"            => String,
    "body"          => String,
    "display_style" => String,
    "readme"        => String
  }

  tests('success') do

    tests('#list_snapshots') do
      snapshots = Fog::Compute[:terminal].list_snapshots.body
      test 'returns a Hash' do
        snapshots.is_a? Hash
      end
      tests('snapshot').data_matches_schema(@snapshot_format, {:allow_extra_keys => true}) do
        snapshots['snapshots'].first
      end
    end

  end

end
