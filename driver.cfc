component extends='Gateway' {

    fields = array(
        field(      // Have one of these for every custom parameter you'd like
            'External URL',     // Friendly name for the field
            'url',              // Key name for the field, used in the custom structure in onBeforeUpdate()
            '',                 // Default value
            true,               // Required? boolean value
            'A URL?' ,          // Description of this field
            'text'              // Type of this field
        )
    );

    string function getCFCPath() {
        // This is the cfc path relative to webroot.  You can use mapped directories etc here if you'd like.
        // In this skeleton though "gateway" resolves to "/gateway.cfc"
        return 'gateway';
    }

    string function getLabel() {
        // Put whatever label you like here, this will appear in the dropdown in the admin panel
        return 'Lucee Skeleton Event Gateway';
    }

    string function getDescription() {
        // Description of this event gateway, this will appear in the admin panel when editing a gateway of this type.
        return 'Connect to a Slack server and react to messages';
    }

    void function onBeforeUpdate(
        required string cfcPath,
        required string startupMode,
        required struct custom
    ) {
        // This method fires after you save the configuration for each gateway in the admin panel
        // Use this to validate any parameters as needed
        // Here I am simply checking to make sure it's not empty
        arguments.custom.url = arguments.custom.url ?: '';
        if (
            Len( arguments.custom.url ) == 0
        ) {
            throw(
                message='URL ['&arguments.custom.url&'] must not be empty'
            );
        }
    }

}