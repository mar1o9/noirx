{ unpkgs, inputs, system, ...}:
{
    environment.systemPackages = with unpkgs; [
        inputs.zen-browser.packages."${system}".default
        ghostty  # Add this back properly if needed
        tmux
        neovim
        zed-editor
        #mold
        #gnumake
        # cmake
        # llvmPackages_20.llvm
        llvmPackages_20.clang
        llvmPackages_20.clang-tools
        nixd
    ];
}
