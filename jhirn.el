;;add vendor dir
(add-to-list 'load-path (concat dotfiles-dir "/vendor"))
(progn (cd "~/.emacs.d/vendor")
       (normal-top-level-add-subdirs-to-load-path))

;; Add my personal figs
(map 'list (lambda (f) (load-file (concat  dotfiles-dir "/figs/" f)))
     (list "colors.el"
           "move-backups.el"))


;; Path fuckery thanks to OSX not honoring .bash_profiles... 
(setenv "PATH" (concat "/opt/local/bin" ":"
                       "/usr/local/bin" ":"
                       (getenv "PATH")))
(setq exec-path (append exec-path '("/opt/local/bin")))
(setq exec-path (append exec-path '("/usr/local/mongo/bin")))

(defun maximize-frame ()
  (interactive)
  (set-frame-position (selected-frame) 0 0)
  (set-frame-size (selected-frame) 1000 1000))

;; Keyboard and mouse
(setq
 ns-command-modifier   'meta       ; Apple/Command key is Meta
 ns-alternate-modifier 'super      ; Option is the Mac Option key
 mouse-wheel-scroll-amount '(1)
 mouse-wheel-progressive-speed nil
 )

(global-set-key (kbd "M-z") 'undo)
(global-set-key (kbd "M-l") 'goto-line)
(global-set-key (kbd "C-S-f") 'indent-buffer)


(defun my-revert-buffer()
  "revert buffer without asking for confirmation"
  (interactive "")
  (revert-buffer t t)
  )

(global-set-key (kbd "C-x C-v") 'my-revert-buffer)

;;You are... so beautiful... to meeeeeeeeeeeeeeeeeeeeeeeeeeeeee
(pastels-color-theme)
(set-frame-parameter (selected-frame) 'alpha '(94 75))
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;;rspec-mode
(require 'rspec-mode)
(rspec-mode)

;;rvm-mode
(require 'rvm)

;;cucumber
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))


(server-start)



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

;;yasnippet
(require 'yasnippet)
(yas/load-directory (concat dotfiles-dir "vendor/yasnippet-0.6.1c/snippets"))
(yas/load-directory (concat dotfiles-dir "vendor/cucumber/snippets"))
(yas/minor-mode-on)

;;packin a mac in the back of the ack
(require 'ack-emacs)
(require 'ack-in-project)

