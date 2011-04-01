(defproject build-monitor "0.1"
	:description "Build monitor server"
	:dependencies [[clojure "1.2.0"]
			[compojure "0.6.2"]
			[hiccup "0.3.4"]
			[serial-port "1.0.7"]]
	:dev-dependencies [[lein-ring "0.4.0"]]
	:ring {:handler buildmonitor.core/app})

