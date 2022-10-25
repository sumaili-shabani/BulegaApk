@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">{{ __('Dashboard') }}</div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif

                    {{ __('You are logged in!') }}

                  {{--   <img src="'.$logoSite.'"  width="100" height="100" style="float: right; margin-top: 10px;" /> --}}
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
