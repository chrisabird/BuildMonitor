(ns buildmonitor
  (:use compojure.core, ring.adapter.jetty, hiccup.core)
  (:require [compojure.route :as route]))

(defroutes main-routes
  (GET "/" [] 
    (html 
      [:html 
	[:body
	  [:a "color"]]]))
  (route/not-found "<h1>Page not found</h1>"))

(run-jetty main-routes {:port 8080})
