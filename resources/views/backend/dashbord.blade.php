
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="csrf-token" content="{{csrf_token() }} ">
    <meta name="csrf-token" value="{{ csrf_token() }}"/>
    <script>window.Laravel={ csrfToken:'{{csrf_token() }}'} </script>
    
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">

   
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Dashboard | Application</title>

   
    
    <!-- mes scripts -->
    <link rel="shortcut icon" href="./images/pnud.png">
    <!-- fin mes scripts -->

    {{-- swot et canavas --}}
    <link rel="stylesheet" href="{{ asset('css/canvas.css') }}">
    <link rel="stylesheet" href="{{ asset('css/beagle.css') }}">
    <link rel="stylesheet" href="{{ asset('css/swot.css') }}">
     
    {{-- fin swot et canavas --}}

    {{-- <link href="{{ asset('css/app.css') }}" rel="stylesheet"> --}}
    <!-- <link rel="stylesheet" href="{{ asset('css/bootstrap.css') }}"> -->

    
</head>
<body>


	@if(!isset(auth()->user()->email))
	<script type="text/javascript">
	  window.location="{{url('login')}}" 
	</script>
	
	@endif



	<div id="app">

	    <app-init></app-init>
	</div>

	<script type="text/javascript">
	        window.emerfine = {!! json_encode([
	            'baseURL' => url('/'),
	            'apiBaseURL' => url('/api'),
	            'user' => auth()->user()
	        ]) !!}
	</script>

	<script src="{{ mix('js/app.js') }}"></script>

	
</body>
</html>