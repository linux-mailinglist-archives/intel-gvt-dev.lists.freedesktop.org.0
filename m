Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CB9225CC1
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 20 Jul 2020 12:39:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B2689D89;
	Mon, 20 Jul 2020 10:39:21 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41DB889D89
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 20 Jul 2020 10:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595241559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sklRsRTSQU9Hiyxm0q5Mr8YUheq3vmnY8+P0vWizCkA=;
 b=PJxtnPzP+EJeqYgbG1bjbrUCEhMGz7aO7YdOzclfSJxXm6QAahEuYpuffcyH0KnTuPZ5CK
 zvmsbF/CLSBxo+mh+irdk6EhegTO9qvMP/0g3zr62GAoCDYekK59N2nnbSpYrgO1BQfJAz
 38YPu6Kk+P76Gl6Uh3Izdb858kw3s0A=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-uEjmrOxxNfCEgYKkc17xyA-1; Mon, 20 Jul 2020 06:39:17 -0400
X-MC-Unique: uEjmrOxxNfCEgYKkc17xyA-1
Received: by mail-wm1-f69.google.com with SMTP id b13so14113701wme.9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 20 Jul 2020 03:39:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sklRsRTSQU9Hiyxm0q5Mr8YUheq3vmnY8+P0vWizCkA=;
 b=ZVEXoowKzu4GVOFgc0j7mmifRwDEmn4TxPirrHADXdTAbqDhfPfEyx7nJWlizjJnM2
 Xl3dFhIjARknD77EWfmgsq1rTz5b7N4Kdn9StcmQ86NF9eKMW6/HIlgzHu3qS/vaVoZW
 v6k7dGdKr73km8S5c3Q+z1sKTk0+oI5BQM1IQvlRofXB5fOfsLCZR9rWuHXNkz8Sjm+G
 PUyUY6alqsevy2ixVc3y6EzJPfVcqFtw0324JEhQNmw6A/WUY+K7kCDl2NXuPN1fQhL9
 TR8bmGJZpl+l+bR92tovcJz15rHzafOh/ZGpIs3xL//wo3kqo2xlI4j4mvbpSE0XXXkT
 KN+A==
X-Gm-Message-State: AOAM530ZKCOrYHzJABWFV7ay9TXyeMHRnij5NxGr7FWOhvc9sZRVcP6O
 6PGUYfCD9BxLoNUtUAT75joOI05QmXID6JbiBNO86Am/4Z0vFb1MbKJlp4kBlmD0ExK83vGcTZt
 riMJwHgCqBAkKfSjGgnmbRvXoGPE2d+foNA==
X-Received: by 2002:adf:a11d:: with SMTP id o29mr3508128wro.421.1595241556144; 
 Mon, 20 Jul 2020 03:39:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwl8UsImJLC98sdzsBmUeXUpIS1hPMSxtTVUgonzL8XKvJioH4iWMe8CewSGE+efnYGdkopJQ==
X-Received: by 2002:adf:a11d:: with SMTP id o29mr3508112wro.421.1595241555829; 
 Mon, 20 Jul 2020 03:39:15 -0700 (PDT)
Received: from pop-os ([51.37.88.107])
 by smtp.gmail.com with ESMTPSA id t13sm8425187wru.65.2020.07.20.03.39.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 20 Jul 2020 03:39:15 -0700 (PDT)
Message-ID: <60d5c1609aaef72f2877aaacff04dc7187e4b3a5.camel@redhat.com>
Subject: Re: device compatibility interface for live migration with assigned
 devices
From: Sean Mooney <smooney@redhat.com>
To: Jason Wang <jasowang@redhat.com>, Alex Williamson
 <alex.williamson@redhat.com>, Yan Zhao <yan.y.zhao@intel.com>
Date: Mon, 20 Jul 2020 11:39:14 +0100
In-Reply-To: <95c13c9b-daab-469b-f244-a0f741f1b41d@redhat.com>
References: <20200713232957.GD5955@joy-OptiPlex-7040>
 <9bfa8700-91f5-ebb4-3977-6321f0487a63@redhat.com>
 <20200716083230.GA25316@joy-OptiPlex-7040>
 <20200717101258.65555978@x1.home>
 <95c13c9b-daab-469b-f244-a0f741f1b41d@redhat.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2
Mime-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: shaohe.feng@intel.com, corbet@lwn.net, kevin.tian@intel.com,
 cohuck@redhat.com, berrange@redhat.com, kvm@vger.kernel.org, devel@ovirt.org,
 libvir-list@redhat.com, eskultet@redhat.com, jian-feng.ding@intel.com,
 qemu-devel@nongnu.org, zhenyuw@linux.intel.com, dgilbert@redhat.com,
 bao.yumeng@zte.com.cn, kwankhede@nvidia.com,
 openstack-discuss@lists.openstack.org, xin-ran.wang@intel.com,
 dinechin@redhat.com, hejie.xu@intel.com, intel-gvt-dev@lists.freedesktop.org,
 eauger@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIwLTA3LTIwIGF0IDExOjQxICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+IE9u
IDIwMjAvNy8xOCDkuIrljYgxMjoxMiwgQWxleCBXaWxsaWFtc29uIHdyb3RlOgo+ID4gT24gVGh1
LCAxNiBKdWwgMjAyMCAxNjozMjozMCArMDgwMAo+ID4gWWFuIFpoYW8gPHlhbi55LnpoYW9AaW50
ZWwuY29tPiB3cm90ZToKPiA+IAo+ID4gPiBPbiBUaHUsIEp1bCAxNiwgMjAyMCBhdCAxMjoxNjoy
NlBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+ID4gPiA+IE9uIDIwMjAvNy8xNCDkuIrljYg3
OjI5LCBZYW4gWmhhbyB3cm90ZToKPiA+ID4gPiA+IGhpIGZvbGtzLAo+ID4gPiA+ID4gd2UgYXJl
IGRlZmluaW5nIGEgZGV2aWNlIG1pZ3JhdGlvbiBjb21wYXRpYmlsaXR5IGludGVyZmFjZSB0aGF0
IGhlbHBzIHVwcGVyCj4gPiA+ID4gPiBsYXllciBzdGFjayBsaWtlIG9wZW5zdGFjay9vdmlydC9s
aWJ2aXJ0IHRvIGNoZWNrIGlmIHR3byBkZXZpY2VzIGFyZQo+ID4gPiA+ID4gbGl2ZSBtaWdyYXRp
b24gY29tcGF0aWJsZS4KPiA+ID4gPiA+IFRoZSAiZGV2aWNlcyIgaGVyZSBjb3VsZCBiZSBNREVW
cywgcGh5c2ljYWwgZGV2aWNlcywgb3IgaHlicmlkIG9mIHRoZSB0d28uCj4gPiA+ID4gPiBlLmcu
IHdlIGNvdWxkIHVzZSBpdCB0byBjaGVjayB3aGV0aGVyCj4gPiA+ID4gPiAtIGEgc3JjIE1ERVYg
Y2FuIG1pZ3JhdGUgdG8gYSB0YXJnZXQgTURFViwKPiA+ID4gPiA+IC0gYSBzcmMgVkYgaW4gU1JJ
T1YgY2FuIG1pZ3JhdGUgdG8gYSB0YXJnZXQgVkYgaW4gU1JJT1YsCj4gPiA+ID4gPiAtIGEgc3Jj
IE1ERVYgY2FuIG1pZ3JhdGlvbiB0byBhIHRhcmdldCBWRiBpbiBTUklPVi4KPiA+ID4gPiA+ICAg
ICAoZS5nLiBTSU9WL1NSSU9WIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkgY2FzZSkKPiA+ID4gPiA+
IAo+ID4gPiA+ID4gVGhlIHVwcGVyIGxheWVyIHN0YWNrIGNvdWxkIHVzZSB0aGlzIGludGVyZmFj
ZSBhcyB0aGUgbGFzdCBzdGVwIHRvIGNoZWNrCj4gPiA+ID4gPiBpZiBvbmUgZGV2aWNlIGlzIGFi
bGUgdG8gbWlncmF0ZSB0byBhbm90aGVyIGRldmljZSBiZWZvcmUgdHJpZ2dlcmluZyBhIHJlYWwK
PiA+ID4gPiA+IGxpdmUgbWlncmF0aW9uIHByb2NlZHVyZS4KPiA+ID4gPiA+IHdlIGFyZSBub3Qg
c3VyZSBpZiB0aGlzIGludGVyZmFjZSBpcyBvZiB2YWx1ZSBvciBoZWxwIHRvIHlvdS4gcGxlYXNl
IGRvbid0Cj4gPiA+ID4gPiBoZXNpdGF0ZSB0byBkcm9wIHlvdXIgdmFsdWFibGUgY29tbWVudHMu
Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IAo+ID4gPiA+ID4gKDEpIGludGVyZmFjZSBkZWZpbml0aW9u
Cj4gPiA+ID4gPiBUaGUgaW50ZXJmYWNlIGlzIGRlZmluZWQgaW4gYmVsb3cgd2F5Ogo+ID4gPiA+
ID4gCj4gPiA+ID4gPiAgICAgICAgICAgICAgICBfXyAgICB1c2Vyc3BhY2UKPiA+ID4gPiA+ICAg
ICAgICAgICAgICAgICAvXCAgICAgICAgICAgICAgXAo+ID4gPiA+ID4gICAgICAgICAgICAgICAg
LyAgICAgICAgICAgICAgICAgXHdyaXRlCj4gPiA+ID4gPiAgICAgICAgICAgICAgIC8gcmVhZCAg
ICAgICAgICAgICAgXAo+ID4gPiA+ID4gICAgICBfX19fX19fXy9fX19fX19fX19fICAgICAgIF9f
X1x8L19fX19fX19fX19fX18KPiA+ID4gPiA+ICAgICB8IG1pZ3JhdGlvbl92ZXJzaW9uIHwgICAg
IHwgbWlncmF0aW9uX3ZlcnNpb24gfC0tPmNoZWNrIG1pZ3JhdGlvbgo+ID4gPiA+ID4gICAgIC0t
LS0tLS0tLS0tLS0tLS0tLS0tLSAgICAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tICAgY29tcGF0aWJp
bGl0eQo+ID4gPiA+ID4gICAgICAgIGRldmljZSBBICAgICAgICAgICAgICAgICAgICBkZXZpY2Ug
Qgo+ID4gPiA+ID4gCj4gPiA+ID4gPiAKPiA+ID4gPiA+IGEgZGV2aWNlIGF0dHJpYnV0ZSBuYW1l
ZCBtaWdyYXRpb25fdmVyc2lvbiBpcyBkZWZpbmVkIHVuZGVyIGVhY2ggZGV2aWNlJ3MKPiA+ID4g
PiA+IHN5c2ZzIG5vZGUuIGUuZy4gKC9zeXMvYnVzL3BjaS9kZXZpY2VzLzAwMDBcOjAwXDowMi4w
LyRtZGV2X1VVSUQvbWlncmF0aW9uX3ZlcnNpb24pLgo+ID4gPiA+IAo+ID4gPiA+IEFyZSB5b3Ug
YXdhcmUgb2YgdGhlIGRldmxpbmsgYmFzZWQgZGV2aWNlIG1hbmFnZW1lbnQgaW50ZXJmYWNlIHRo
YXQgaXMKPiA+ID4gPiBwcm9wb3NlZCB1cHN0cmVhbT8gSSB0aGluayBpdCBoYXMgbWFueSBhZHZh
bnRhZ2VzIG92ZXIgc3lzZnMsIGRvIHlvdQo+ID4gPiA+IGNvbnNpZGVyIHRvIHN3aXRjaCB0byB0
aGF0Pwo+ID4gCj4gPiBBZHZhbnRhZ2VzLCBzdWNoIGFzPwo+IAo+IAo+IE15IHVuZGVyc3RhbmRp
bmcgZm9yIGRldmxpbmsobmV0bGluaykgb3ZlciBzeXNmcyAoc29tZSBhcmUgbWVudGlvbmVkIGF0
IAo+IHRoZSB0aW1lIG9mIHZEUEEgc3lzZnMgbWdtdCBBUEkgZGlzY3Vzc2lvbikgYXJlOgppIHRv
dWdodCBuZXRsaW5rIHdhcyB1c2VkIG1vcmUgYSBhcyBhIGNvbmZpZ3VyYXRpb24gcHJvdG9jb2Fs
IHRvIHF1cnJ5IGFuZCBjb25maXJlIG5pYyBhbmQgaSBndWVzcwpvdGhlciBkZXZpY2VzIGluIGl0
cyBkZXZsaW5rIGZvcm0gcmVxdWlyZWludCBhIHRvb2wgdG8gYmUgd2l0dGVuIHRoYXQgY2FuIHNw
ZWFrIHRoZSBwcm90b2NhbCB0byBpbnRlcmFjdCB3aXRoLgp0aGUgcHJpbWFyeSBhZHZhbnRhdGUg
b2Ygc3lzZnMgaXMgdGhhdCBldmVyeXRoaW5nIGlzIGp1c3QgYSBmaWxlLiB0aGVyZSBhcmUgbm8g
YWRkdGlvbmFsIGRlcGxlZW5jZWlzCm5lZWRlZCBhbmQgdW5saWtlIG5ldGxpbmsgdGhlcmUgYXJl
IG5vdCBpbnRlcm9wZXJhdGJsaXR5IGlzc3VlcyBpbiBhIGNvYW5pdG5lcmlzZWQgZW52LiBpZiB5
b3UgYXJlIHVzaW5nIGRpZmZyZW5ldAp2ZXJzaW9uIG9mIGxpYmMgYW5kIGdjYyBpbiB0aGUgY29u
dGFpZW5yIHZzIHRoZSBob3N0IG15IHVuZGVyc3RhbmRpbmcgaXMgdG9vbHMgbGlrZSBldGh0b29s
IGZyb20gdWJ1bnR1IGRlcGxveWVkCmluIGEgY29udGFpbmVyIG9uIGEgY2VudG9zIGhvc3QgY2Fu
IGhhdmUgaXNzdWUgY29tbXVuaWNhdGluZyB3aXRoIHRoZSBob3N0IGtlcm5lbC4gaWYgaXRzIGpz
dXQgYSBmaWxlIHVubGVzcwp0aGUgZm9ybWF0IHRoZSBkYXRhIGlzIHJldHVybmluIGluIGNoYWdu
ZXMgb3IgdGhlIGxheW91dCBvZiBzeXNmcyBjaGFuZ2VzIGl0cyBjb21wYXRpYWJsZSByZWdhcmRs
ZXNzIG9mIHdoYXQgeW91CnVzZSB0byByZWFkIGl0Lgo+IAo+IC0gZXhpc3RpbmcgdXNlcnMgKE5J
QywgY3J5cHRvLCBTQ1NJLCBpYiksIG1hdHVyZSBhbmQgc3RhYmxlCj4gLSBtdWNoIGJldHRlciBl
cnJvciByZXBvcnRpbmcgKGV4dF9hY2sgb3RoZXIgdGhhbiBzdHJpbmcgb3IgZXJybm8pCj4gLSBu
YW1lc3BhY2UgYXdhcmUKPiAtIGRvIG5vdCBjb3VwbGUgd2l0aCBrb2JqZWN0Cj4gCj4gVGhhbmtz
Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRl
bC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2
dC1kZXYK
