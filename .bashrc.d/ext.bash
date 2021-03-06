#!/usr/bin/env bash
#
# BashRcExt.

function BashRcExtKeychain {
	\ProfileRcRunKeychainInteractiv;
};

function BashRcExtGpg {
	\ProfileRcRunGpg 1>/dev/null;
};

function BashRcExtLs {
	\ProfileRcRunLsSet;
};

function BashRcExtZ {
	declare -gx \
		_Z_DATA \
		_Z_NO_PROMPT_COMMAND;

	declare -agx _Z_EXCLUDE_DIRS;

	_Z_DATA=$XDG_VAR_HOME/lib/z/z.data;
	_Z_NO_PROMPT_COMMAND=1;
	_Z_EXCLUDE_DIRS=("$HOME");

	. "$XDG_DATA_HOME/bash/z.sh";

	function zcd {
		declare dir;
		read -r _ dir < <(
			\_z "${@:--l}" 2>&1 |
			/usr/bin/tac |
			"$XDG_BIN_HOME/menu" fzf cd;
		);

		[[ -d $dir ]] &&
			builtin cd -- "$dir";
	};

	alias 'zr=\_z -r';
	alias 'zt=\_z -t';
};

function BashRcExtFzf {
	. "$XDG_BIN_HOME/fzf-bind.bash";
};

function BashRcExtBma {
	declare -gx BMARKS_INDEX_FILE;
	BMARKS_INDEX_FILE=$XDG_VAR_HOME/lib/bmarks.txt;

	. "$XDG_DATA_HOME/bash/bma.bash" &&
		\__bma -i;
};

function BashRcExtBpx {
	# declare -F __bpx_main > /dev/null || . "$XDG_DATA_HOME/"bash/bpx.bash;
	declare -F __bpx_main > /dev/null ||
		. "$XDG_SRC_HOME/bpx/bpx.bash";
};

function BashRcExtPyenv {
	PATH=${PATH//"$PYENV_ROOT/shims:"};
	command -v pyenv 1>/dev/null 2>&1 &&
		eval "$(pyenv init -)";
}

# vim: set ft=sh :
