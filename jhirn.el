;;add vendor dir
(add-to-list 'load-path (concat dotfiles-dir "/vendor"))
(progn (cd "~/.emacs.d/vendor")
       (normal-top-level-add-subdirs-to-load-path))

(map 'list (lambda (f) (load-file (concat  dotfiles-dir "/figs/" f)))
     (list "colors.el"
           "move-backups.el"))


;; Path fuckery 
(setenv "PATH" (concat "/opt/local/bin" ":"
                       "/usr/local/mongo/bin" ":"
                       (getenv "PATH")))
(setq exec-path (append exec-path '("/opt/local/bin")))
(setq exec-path (append exec-path '("/usr/local/mongo/bin")))


;; Keybinding
(setq
  ns-command-modifier   'meta       ; Apple/Command key is Meta
  ns-alternate-modifier 'super      ; Option is the Mac Option key
  )

(global-set-key (kbd "M-z") 'undo)
(global-set-key (kbd "M-l") 'goto-line)
;(global-set-key (kbd "TAB") 'hippie-expand)
(global-set-key (kbd "C-S-f") 'indent-buffer)



(pastels-color-theme)

(require 'rspec-mode)
(rspec-mode)
(require 'rvm)
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))


(server-start)

(defun maximize-frame ()
  (interactive)
  :(set-frame-position (selected-frame) 0 0)
  (set-frame-size (selected-frame) 1000 1000))

(set-frame-parameter (selected-frame) 'alpha '(92 70))

(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;;autocomplete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (concat dotfiles-dir "vendor/auto-complete-1.3/dict"))
(ac-config-default)

;;rsense
(setq rsense-home (concat dotfiles-dir "vendor/rsense/rsense-0.3"))
(add-to-list 'load-path (concat rsense-home "/etc"))
(require 'rsense)
(add-hook 'ruby-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-rsense-method)
            (add-to-list 'ac-sources 'ac-source-rsense-constant)))
;;textmate mode

(require 'textmate)
(textmate-mode)


(require 'yasnippet)
(yas/load-directory (concat dotfiles-dir "vendor/yasnippet-0.6.1c/snippets"))
(yas/load-directory (concat dotfiles-dir "vendor/cucumber/snippets"))


(require 'ack-emacs)
(require 'ack-in-project)
