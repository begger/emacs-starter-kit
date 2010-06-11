;;add vendor dir
(add-to-list 'load-path (concat dotfiles-dir "/vendor"))
(progn (cd "~/.emacs.d/vendor")
       (normal-top-level-add-subdirs-to-load-path))

(map 'list (lambda (f) (load-file (concat  dotfiles-dir "/figs/" f)))
     (list "colors.el"
           "move-backups.el"))


;; Path fuckery 
(setenv "PATH" (concat "/opt/local/bin" ":" "/usr/local/mongo/bin" ":" (getenv "PATH")))
(setq exec-path (append exec-path '("/opt/local/bin")))
(setq exec-path (append exec-path '("/usr/local/mongo/bin")))

;;(setq magit-git-executable "/usr/local/git/bin/git")

;; Keybinding
(setq
  ns-command-modifier   'meta       ; Apple/Command key is Meta
  ns-alternate-modifier 'super      ; Option is the Mac Option key
  )

(global-set-key (kbd "M-z") 'undo)
(global-set-key (kbd "M-l") 'goto-line)
(global-set-key (kbd "TAB") 'hippie-expand)
(global-set-key (kbd "C-S-f") 'indent-buffer)


(pastels-color-theme)

(require 'rspec-mode)
(rspec-mode)
(require 'rvm)
(rvm-use-default)
(server-start)

(defun maximize-frame ()
  (interactive)
  (set-frame-position (selected-frame) 0 0)
  (set-frame-size (selected-frame) 1000 1000))

(set-frame-parameter (selected-frame) 'alpha '(92 70))

(ansi-color-for-comint-mode-on)



