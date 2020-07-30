/*
 * Copyright (C) 2020  Arc676/Alessandro Vinciguerra
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * hangman is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.7
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3

import HangmanBackend 1.0

Page {
	id: gameView
	header: DefaultHeader {}

	HangmanBackend {
		id: backend
	}

	Component {
		id: inputDialog
		WordInputDialog {
			onStartGame: {
				if (!backend.new_game_with_word(word, 8)) {
					PopupUtils.open(errorDialog)
				}
			}
		}
	}

	Component {
		id: errorDialog
		WordErrorDialog {}
	}

	function newGameWithWord() {
		PopupUtils.open(inputDialog)
	}

	function newGameFromWordList() {
	}
}
