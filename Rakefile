
def sys_install(packages)
  sh "sudo apt-get -y install #{packages}"
end

def install_github_system(user, package, location)
  unless File.exist? File.expand_path(location)
    sh "git clone https://github.com/#{user}/#{package} #{location}"
  end
end

def install_github_bundle(user, package)
  install_github_bundle(user, package, "~/.vim/bundle/#{package}")
end

def step(description)
  description = "-- #{description} "
  description = description.ljust(80, '-')
  puts
  puts "\e[32m#{description}\e[0m"
end


def get_backup_path(path)
  number = 1
  backup_path = "#{path}.bak"
  loop do
    if number > 1
      backup_path = "#{backup_path}#{number}"
    end
    if File.exists?(backup_path) || File.symlink?(backup_path)
      number += 1
      next
    end
    break
  end
  backup_path
end

def link_file(original_filename, symlink_filename)
  original_path = File.expand_path(original_filename)
  symlink_path = File.expand_path(symlink_filename)
  if File.exists?(symlink_path) || File.symlink?(symlink_path)
    if File.symlink?(symlink_path)
      symlink_points_to_path = File.readlink(symlink_path)
      return if symlink_points_to_path == original_path
      # Symlinks can't just be moved like regular files. Recreate old one, and
      # remove it.
      ln_s symlink_points_to_path, get_backup_path(symlink_path), :verbose => true
      rm symlink_path
    else
      # Never move user's files without creating backups first
      mv symlink_path, get_backup_path(symlink_path), :verbose => true
    end
  end
  ln_s original_path, symlink_path, :verbose => true
end

def unlink_file(original_filename, symlink_filename)
  original_path = File.expand_path(original_filename)
  symlink_path = File.expand_path(symlink_filename)
  if File.symlink?(symlink_path)
    symlink_points_to_path = File.readlink(symlink_path)
    if symlink_points_to_path == original_path
      # the symlink is installed, so we should uninstall it
      rm_f symlink_path, :verbose => true
      backups = Dir["#{symlink_path}*.bak"]
      case backups.size
      when 0
        # nothing to do
      when 1
        mv backups.first, symlink_path, :verbose => true
      else
        $stderr.puts "found #{backups.size} backups for #{symlink_path}, please restore the one you want."
      end
    else
      $stderr.puts "#{symlink_path} does not point to #{original_path}, skipping."
    end
  else
    $stderr.puts "#{symlink_path} is not a symlink, skipping."
  end
end

namespace :install do

  desc 'Install The Silver Searcher'
  task :the_silver_searcher do
    step 'the_silver_searcher'
    sys_install 'silversearcher-ag'
  end

  desc 'Install zsh'
  task :zsh do
    step 'zsh & oh-my-zsh'
    `mkdir ~/bin`
    `sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
    `wget https://raw.githubusercontent.com/rupa/z/master/z.sh -O ~/bin/z.sh`
  end

  desc 'Install ctags'
  task :ctags do
    step 'ctags'
    sys_install 'exuberant-ctags'
  end

  desc 'Install tmux'
  task :tmux do
    step 'tmux'
    sys_install 'tmux'
    `curl -Lo- https://raw.github.com/tippenein/tmuxrc/master/bootstrap.sh | bash`
  end

  desc 'Install Vundle'
  task :vundle do
    step 'vundle'
    install_github_bundle 'VundleVim','Vundle.vim'
    sh 'vim +PluginInstall +qall'
  end

  desc 'Install Vim plugins'
  task :vplug do
    step 'vplug'
    `cd ~/.vim/bundle/vimproc.vim;make`
  end

  desc 'Install Spacemacs'
  task :spacemacs do
    step 'spacemacs'
    install_github_system('syl20bnr','spacemacs' '~/.emacs.d')
  end

  desc 'Install postgres'
  task :postgres do
    step 'postgres'
    `sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'`
    `wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -`
    sh 'sudo apt-get update'
    sys_install 'postgresql-9.4 postgresql-contrib libpq-dev'
    sh 'createuser --superuser `whoami`'
  end

  desc 'Install ruby specific'
  task :ruby do
    step 'ruby'
    sys_install 'libssl-dev libreadline-dev'
    install_github_system 'rbenv', 'rbenv', '~/.rbenv'
    install_github_system 'rbenv', 'ruby-build', '~/.rbenv/plugins/ruby-build'
  end

  desc 'Install npm / node specific'
  task :node do
    sh 'curl -sL https://deb.nodesource.com/setup_0.12 | sudo -E bash -'
    sys_install 'nodejs'
  end

  desc 'Install docker and docker-compose'
  task :docker do
    step 'docker'
    `wget -qO- https://get.docker.com/ | sh`
    sh 'sudo usermod -aG docker $(whoami)'
    sys_install 'python-pip'
    `sudo pip install docker-compose`
  end

  desc 'move and symlink files/dirs'
  task :move do
    step 'symlink'

    LINKED_FILES.each do |orig, link|
      link_file orig, link
    end

    COPIED_FILES.each do |orig, copy|
      cp orig, copy, :verbose => true unless File.exist?(copy)
    end
  end
end

def filemap(map)
  map.inject({}) do |result, (key, value)|
    result[File.expand_path(key)] = File.expand_path(value)
    result
  end.freeze
end

COPIED_FILES = filemap(
  'vimrc.local'         => '~/.vimrc.local',
  'vimrc.bundles.local' => '~/.vimrc.bundles.local',
)

LINKED_FILES = filemap(
  'vim'                  => '~/.vim',
  'tmux.conf'            => '~/.tmux.conf',
  'vimrc'                => '~/.vimrc',
  'vimrc.bundles'        => '~/.vimrc.bundles',
  'zshrc'                => '~/.zshrc',
  'ghci'                 => '~/.ghci',
  'gitconfig'            => '~/.gitconfig',
  'aliases'              => '~/.aliases',
  'stack-config.yaml'    => '~/.stack/config.yaml',
  'stylish-haskell.yaml' => '~/.stylish-haskell.yaml',
  'spacemacs'            => '~/.spacemacs',
  '~/.vimrc'             => '~/.nvimrc',
  '~/.vim'               => '~/.nvim'
)

desc 'Install these config files.'
task :install do
  Rake::Task['install:the_silver_searcher'].invoke
  Rake::Task['install:ctags'].invoke
  Rake::Task['install:tmux'].invoke
  Rake::Task['install:zsh'].invoke
  Rake::Task['install:move'].invoke
  Rake::Task['install:vundle'].invoke
  Rake::Task['install:vplug'].invoke
  Rake::Task['install:spacemacs'].invoke
  Rake::Task['install:ruby'].invoke
  Rake::Task['install:postgres'].invoke
end

desc 'Uninstall these config files.'
task :uninstall do
  step 'un-symlink'

  # un-symlink files that still point to the installed locations
  LINKED_FILES.each do |orig, link|
    unlink_file orig, link
  end

  # delete unchanged copied files
  COPIED_FILES.each do |orig, copy|
    rm_f copy, :verbose => true if File.read(orig) == File.read(copy)
  end
end

task :default => :install
