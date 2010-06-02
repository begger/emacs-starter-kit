;;add vendor dir
(add-to-list 'load-path (concat dotfiles-dir "/vendor"))
(progn (cd "~/.emacs.d/vendor")
       (normal-top-level-add-subdirs-to-load-path))

;; Path fuckery
(setenv "PATH" (concat "/opt/local/bin" ":" (getenv "PATH")))
(setq exec-path (append exec-path '("/opt/local/bin")))

;; Keybinding
(setq
  ns-command-modifier   'meta       ; Apple/Command key is Meta
  ns-alternate-modifier 'super      ; Option is the Mac Option key
  )

(global-set-key (kbd "M-z") 'undo)
(global-set-key (kbd "M-l") 'goto-line)

