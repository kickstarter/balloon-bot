# This file was auto-generated by lib/tasks/web.rake

desc 'Apps methods.'
command 'apps' do |g|
  g.desc 'This method uninstalls a workspace app. Unlike auth.revoke, which revokes a single token, this method revokes all tokens associated with a single installation of a workspace app.'
  g.long_desc %( This method uninstalls a workspace app. Unlike auth.revoke, which revokes a single token, this method revokes all tokens associated with a single installation of a workspace app. )
  g.command 'uninstall' do |c|
    c.flag 'client_id', desc: 'Issued when you created your application.'
    c.flag 'client_secret', desc: 'Issued when you created your application.'
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.apps_uninstall(options))
    end
  end
end
