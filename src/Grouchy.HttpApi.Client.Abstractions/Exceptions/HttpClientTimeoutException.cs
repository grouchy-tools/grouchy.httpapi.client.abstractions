﻿using System;
using System.Net.Http;

namespace Grouchy.HttpApi.Client.Abstractions.Exceptions
{
   public class HttpClientTimeoutException : Exception
   {
      public HttpClientTimeoutException(HttpMethod method, Uri requestUri)
         : base($"Request timed-out, {method} {requestUri}")
      {
         Method = method;
         RequestUri = requestUri;
      }

      public HttpMethod Method { get; }

      public Uri RequestUri { get; }
   }
}
