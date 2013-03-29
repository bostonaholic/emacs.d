(defun erc-start ()
  (interactive)
  (erc :server "irc.freenode.net" :port 6667 :nick "bostonaholic"))

;; autojoin channels
;; (setq erc-autojoin-channels-alist
;;       '(("freenode.net" "#clojure")))

;; ignore notices
(setq erc-hide-list '("JOIN" "PART" "QUIT"))

;; autoconnect to freenode
;; (erc :server "irc.freenode.net" :port 6667 :nick "bostonaholic")
