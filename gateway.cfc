component {
	
	variables.state = 'stopped';

	public void function init(
		string id,
		struct config
	) {
		local.e = '';
		try {
			variables.id = arguments.id;
			variables.config = arguments.config;
			_log('init');
		} catch ( any e ) {
			_handleError( e , 'init' );
		}
	}

   	public void function start() {
   		while ( variables.state == 'stopping' ) {
   			sleep( 10 );
   		}

		_log( 'start' );

   		variables.state = 'running';
   	}

   	public void function stop() {

		_log( 'stop' );

		variables.state = 'stopping';
		variables.state = 'stopped';

   	}

   	public void function restart() {
   		if (
   			variables.state == 'running'
   		) {
   			stop();
   		}
   		start();
   	}

   	public string function getState() {
   		return variables.state;
   	}

   	private void function _handleError(
   		struct catchData = {},
   		string functionName
   	) {
		_log( 'error' );
   	}

   	private void function _log(
   		required string text, 
   		string type = 'information'
   	) {
		log text=arguments.text type=arguments.type file='event-gateway-sksleton';
	}

}