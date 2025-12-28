function fish_prompt --description 'Write out the prompt'
    set -l last_status $status
    set -l normal (set_color normal)
    set -l status_color (set_color brgreen)
    set -l cwd_color (set_color $fish_color_cwd)
    set -l vcs_color (set_color brpurple)
    set -l prompt_status ""

    # Since we display the prompt on a new line allow the directory names to be longer.
    set -q fish_prompt_pwd_dir_length
    or set -lx fish_prompt_pwd_dir_length 0

    # Color the prompt differently when we're root
    set -l suffix '❯'
    if functions -q fish_is_root_user; and fish_is_root_user
        if set -q fish_color_cwd_root
            set cwd_color (set_color $fish_color_cwd_root)
        end
        set suffix '#'
    end

    # Color the prompt in red on error
    if test $last_status -ne 0
        set status_color (set_color $fish_color_error)
        set prompt_status $status_color "[" $last_status "]" $normal
    end

    # First line: Add nix shell name at the first 
    if set -q NIX_SHELL_NAME
        set -l name (string upper -- $NIX_SHELL_NAME)
        set -l color1 aaaaff # light violet
        set -l color2 7e7eff # dark violet
        switch $name
            case GO
                set color brcyan
            case PY
                set color brblue
            case JS
                set color bryellow
            case RS
                set color brred
            case ZIG
                set color bryellow
        end
        echo -n -s (set_color $color2) '[' (set_color -o $color1) $NIX_SHELL_NAME (set_color $color2) ']' (set_color normal) ' '
    end

    # login, cwd, vcs branch (if any)
    echo -n -s \
        $cwd_color (prompt_pwd) \
        $vcs_color (fish_vcs_prompt) $normal

    # Status if any
    echo -s ' ' $prompt_status

    # Second line: prompt symbol
    echo -n -s $status_color $suffix ' ' $normal
end
