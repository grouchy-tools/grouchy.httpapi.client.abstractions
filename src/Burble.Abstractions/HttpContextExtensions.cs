﻿namespace Burble.Abstractions
{
   using System.Net.Http;
   using System.Threading;
   using System.Threading.Tasks;

   public static class HttpContextExtensions
   {
      public static Task<HttpResponseMessage> SendAsync(
         this IHttpClient httpClient,
         HttpRequestMessage request)
      {
         return httpClient.SendAsync(request, CancellationToken.None);
      }

      public static Task<HttpResponseMessage> GetAsync(
         this IHttpClient httpClient,
         string requestUri)
      {
         var request = new HttpRequestMessage(HttpMethod.Get, requestUri);

         return httpClient.SendAsync(request, CancellationToken.None);
      }

      public static Task<HttpResponseMessage> GetAsync(
         this IHttpClient httpClient,
         string requestUri,
         CancellationToken cancellationToken)
      {
         var request = new HttpRequestMessage(HttpMethod.Get, requestUri);

         return httpClient.SendAsync(request, cancellationToken);
      }
   }
}
