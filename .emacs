; start package.el with emacs

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package)

; === KEY BINDINGS ===

; Use [s-X] on Mac OS to bind cmd key instead of Alt key [M-X]
(global-set-key [M-up] 'windmove-up)              ; move to upper window
(global-set-key [M-down] 'windmove-down)          ; move to lower window
(global-set-key [M-right] 'windmove-right)        ; move to right window
(global-set-key [M-left] 'windmove-left)          ; move to left window

(setq inhibit-splash-screen t)
(tool-bar-mode 0)
(menu-bar-mode 0)
(column-number-mode 1)
(load-theme 'tango-dark)
(fset 'yes-or-no-p 'y-or-n-p)

; set fullscreen
;;(defun fullscreen (&optional f)
;;       (interactive)
;;       (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
;;               '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
;;       (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
;;               '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))
;;(fullscreen)

(setq frame-title-format '(buffer-file-name "%f" ("%b")))

; Setting default directory to $HOME on Mac OS
(setq default-directory "~/")
(setq command-line-default-directory "~/")

;;(desktop-save-mode 1)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)



(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)



;;(add-to-list 'load-path "~/.emacs.d/autocomplete")
;;(add-to-list 'ac-dictionary-directories "~/.emacs.d/autocomplete/ac-dict")
;;(load "auto-complete.el")
;;(load "auto-complete-config.el")
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

(semantic-mode 1)
(global-semantic-idle-completions-mode)
(global-semantic-idle-scheduler-mode)
(global-semantic-stickyfunc-mode)
;; (global-semantic-decoration-mode)
(global-semantic-highlight-func-mode)
(global-semantic-highlight-edits-mode)
(global-semantic-mru-bookmark-mode)

(global-ede-mode 1)
;;(ede-enable-generic-projects)

(auto-fill-mode 1)
;;(gtags-mode 1)

(add-to-list 'auto-mode-alist '("\\.ipp$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-layout-name "myright")
 '(ecb-layout-window-sizes
   (quote
    (("myright"
      (ecb-directories-buffer-name 0.22761194029850745 . 0.27631578947368424)
      (ecb-sources-buffer-name 0.22761194029850745 . 0.2236842105263158)
      (ecb-methods-buffer-name 0.22761194029850745 . 0.3157894736842105)
      (ecb-history-buffer-name 0.22761194029850745 . 0.18421052631578946))
     ("right1"
      (ecb-directories-buffer-name 0.22761194029850745 . 0.29411764705882354)
      (ecb-sources-buffer-name 0.22761194029850745 . 0.3382352941176471)
      (ecb-methods-buffer-name 0.22761194029850745 . 0.35294117647058826)))))
 '(ecb-options-version "2.50")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1))
 '(ecb-tip-of-the-day nil)
 '(ede-project-directories (quote ("~/PythonServer" "~/Project/src")))
 '(package-selected-packages
   (quote
    (go-mode popup clang-format cmake-mode protobuf-mode auto-complete ecb markdown-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(ecb-activate)

; === CODE STYLE ===

(add-to-list 'load-path "~/.emacs.d/google-c-style")
(load "google-c-style.el")
; Set google C style
(require 'google-c-style)
;(add-hook 'c-mode-common-hook 'google-set-c-style)
;(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;(setq exec-path (append exec-path '("/usr/local/bin/clang-format")))
                                        ;(load "/usr/local/share/clang/clang-format.el")
(require 'clang-format)
(global-set-key [C-M-tab] 'clang-format-region)


;; (c-add-style "abudnik"
;; 			  '("Ellemtel"
;; 			   (c-basic-offset . 4)
;; 			   (c-hanging-braces-alist . ((substatement-open before after)
;; 										  (arglist-cont-nonempty)))
;; 			   (c-offsets-alist
;; 				(topmost-intro . 0)
;; 				(substatement . +)
;; 				(substatement-open . 0)
;; 				(case-label . +)
;; 				(access-label . -)
;; 				(inclass . +)
;; 				(inline-open . 0)
;; 				(innamespace . 0)
;; 				(member-init-cont . -1)
;; 				(member-init-intro . 0)
;; 				(friend . -)
;; 				)))

; === MODE HOOKS ===

 (add-hook 'c++-mode-hook
           '(lambda ()
;;              (c-set-style "abudnik")
              'google-set-c-style
              ;; rebind key mappings
              (local-set-key (kbd "M-w") 'kill-region)
              (local-set-key (kbd "C-w") 'kill-ring-save)
            )

 )
 (add-hook 'c-mode-hook
           '(lambda ()
;;              (c-set-style "abudnik")
              'google-set-c-style
              ;; rebind key mappings
              (local-set-key (kbd "M-w") 'kill-region)
              (local-set-key (kbd "C-w") 'kill-ring-save)
            )
 )


; === WORKAROUNDS ===

(defun display-buffer-at-bottom--display-buffer-at-bottom-around (orig-fun &rest args)
  "Bugfix for ECB: cannot use display-buffer-at-bottom', calldisplay-buffer-use-some-window' instead in ECB frame."
  (if (and ecb-minor-mode (equal (selected-frame) ecb-frame))
      (apply 'display-buffer-use-some-window args)
    (apply orig-fun args)))
(advice-add 'display-buffer-at-bottom :around #'display-buffer-at-bottom--display-buffer-at-bottom-around)
