require 'rake'
require 'fileutils'

desc "Hook our dotfiles into system-standard positions."
task :install do
  puts
  puts "======================================================"
  puts "Installing your files."
  puts "======================================================"
  puts

  Rake::Task[:install_vim].execute
end

task :install_vim do
    run %{ mkdir $HOME/.config/nvim }
    run %{ ln -nfs "$DOTS/nvim/init.vim" "${ZDOTDIR:-$HOME}/.config/nvim/init.vim" }
    puts 'Installing vim-plug'
    run %{ curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim }
    puts 'Installing plugs'
    run %{ nvim +'PlugInstall --sync' +qa }
end

task :install_zsh do
  puts 'Installing zsh'
end

def install_files(files, method = :symlink)
  files.each do |f|
    file = f.split('/').last
    source = "#{ENV["PWD"]}/#{f}"
    target = "#{ENV["HOME"]}/.#{file}"

    puts "======================#{file}=============================="
    puts "Source: #{source}"
    puts "Target: #{target}"

    if File.exists?(target) && (!File.symlink?(target) || (File.symlink?(target) && File.readlink(target) != source))
      puts "[Overwriting] #{target}...leaving original at #{target}.backup..."
      run %{ mv "$HOME/.#{file}" "$HOME/.#{file}.backup" }
    end

    if method == :symlink
      run %{ ln -nfs "#{source}" "#{target}" }
    else
      run %{ cp -f "#{source}" "#{target}" }
    end
  end
end

def success_msg(action)
  puts "WP. #{action} was successful!"
end
