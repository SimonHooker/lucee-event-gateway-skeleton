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
		// Just giving it a little chance to stop if it's stopping
		while ( variables.state == 'stopping' ) {
			sleep( 10 );
		}

		_log( 'start' );

		// Do whatever you like here, a good option here is an infinite loop until state !== 'running'
		try {
			variables.state = 'starting';

			// You could perform some startup logic right here

			variables.state = 'running';
			while ( variables.state == 'running' ) {

				// Do stuff here
				// Do stuff here
				// Do stuff here
				// Do stuff here
				// Do stuff here

				// You probably want to sleep between iterations instead of killing your server
				sleep( 100 );

			}

		} catch (e) {
			variables.state = 'failed : ' & cfcatch.message;
			_handleError( cfcatch , 'start' );
			rethrow;
		}
	}

	public void function stop() {

		_log( 'stop' );

		variables.state = 'stopping';

		// Cleanup logic could come in to here

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
		log text=arguments.text type=arguments.type file='event-gateway-skeleton';
	}

}