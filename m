Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA972492FA
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 19 Aug 2020 04:46:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE6CB89AC2;
	Wed, 19 Aug 2020 02:46:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9073889AC2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 19 Aug 2020 02:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597805182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YHzwrXrXbLwizcmmmBRfV2cYeOLa+iyjDJxZ2l+hNLM=;
 b=V1QK719Ad0Tx6SjM3hFNcukadhH/ZCKgMmuwJX8BaBba+e1ORdIq6T6hyfyRA7MtquegNe
 11quf+6NDrF1n4DO/z/OuQuwXN+JOqmoXxYL5bxjJJHo5Sx+Xy+D37wFywnb1LaSBQZjuj
 SIhWEFEVEhdYmoOoc7wkYn8ZhtowSqk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-6L_flAJUOaWxJy5I7WQLeA-1; Tue, 18 Aug 2020 22:46:20 -0400
X-MC-Unique: 6L_flAJUOaWxJy5I7WQLeA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8390F81F028;
 Wed, 19 Aug 2020 02:46:18 +0000 (UTC)
Received: from [10.72.13.88] (ovpn-13-88.pek2.redhat.com [10.72.13.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 759E15D9E4;
 Wed, 19 Aug 2020 02:45:59 +0000 (UTC)
Subject: Re: device compatibility interface for live migration with assigned
 devices
To: Parav Pandit <parav@nvidia.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20200805021654.GB30485@joy-OptiPlex-7040>
 <2624b12f-3788-7e2b-2cb7-93534960bcb7@redhat.com>
 <20200805075647.GB2177@nanopsycho>
 <eb1d01c2-fbad-36b6-10cf-9e03483a736b@redhat.com>
 <20200805093338.GC30485@joy-OptiPlex-7040> <20200805105319.GF2177@nanopsycho>
 <20200810074631.GA29059@joy-OptiPlex-7040>
 <e6e75807-0614-bd75-aeb6-64d643e029d3@redhat.com>
 <20200814051601.GD15344@joy-OptiPlex-7040>
 <a51209fe-a8c6-941f-ff54-7be06d73bc44@redhat.com>
 <20200818085527.GB20215@redhat.com>
 <3a073222-dcfe-c02d-198b-29f6a507b2e1@redhat.com>
 <BY5PR12MB43222059335C96F7B050CFDCDC5C0@BY5PR12MB4322.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <934c8d2a-a34e-6c68-0e53-5de2a8f49d19@redhat.com>
Date: Wed, 19 Aug 2020 10:45:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <BY5PR12MB43222059335C96F7B050CFDCDC5C0@BY5PR12MB4322.namprd12.prod.outlook.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Kirti Wankhede <kwankhede@nvidia.com>, "eauger@redhat.com" <eauger@redhat.com>,
 "xin-ran.wang@intel.com" <xin-ran.wang@intel.com>,
 "corbet@lwn.net" <corbet@lwn.net>, "openstack-discuss@lists.openstack.org"
 <openstack-discuss@lists.openstack.org>,
 "shaohe.feng@intel.com" <shaohe.feng@intel.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>, Yan Zhao <yan.y.zhao@intel.com>,
 Parav Pandit <parav@mellanox.com>,
 "jian-feng.ding@intel.com" <jian-feng.ding@intel.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "hejie.xu@intel.com" <hejie.xu@intel.com>,
 "bao.yumeng@zte.com.cn" <bao.yumeng@zte.com.cn>,
 Alex Williamson <alex.williamson@redhat.com>,
 "eskultet@redhat.com" <eskultet@redhat.com>,
 "smooney@redhat.com" <smooney@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Cornelia Huck <cohuck@redhat.com>, Jiri Pirko <jiri@mellanox.com>,
 "dinechin@redhat.com" <dinechin@redhat.com>,
 "devel@ovirt.org" <devel@ovirt.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Ck9uIDIwMjAvOC8xOCDkuIvljYg1OjMyLCBQYXJhdiBQYW5kaXQgd3JvdGU6Cj4gSGkgSmFzb24s
Cj4KPiBGcm9tOiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+IFNlbnQ6IFR1ZXNk
YXksIEF1Z3VzdCAxOCwgMjAyMCAyOjMyIFBNCj4KPgo+IE9uIDIwMjAvOC8xOCDkuIvljYg0OjU1
LCBEYW5pZWwgUC4gQmVycmFuZ8OpIHdyb3RlOgo+IE9uIFR1ZSwgQXVnIDE4LCAyMDIwIGF0IDEx
OjI0OjMwQU0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4gT24gMjAyMC84LzE0IOS4i+WNiDE6
MTYsIFlhbiBaaGFvIHdyb3RlOgo+IE9uIFRodSwgQXVnIDEzLCAyMDIwIGF0IDEyOjI0OjUwUE0g
KzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4gT24gMjAyMC84LzEwIOS4i+WNiDM6NDYsIFlhbiBa
aGFvIHdyb3RlOgo+IGRyaXZlciBpcyBpdCBoYW5kbGVkIGJ5Pwo+IEl0IGxvb2tzIHRoYXQgdGhl
IGRldmxpbmsgaXMgZm9yIG5ldHdvcmsgZGV2aWNlIHNwZWNpZmljLCBhbmQgaW4KPiBkZXZsaW5r
LmgsIGl0IHNheXMKPiBpbmNsdWRlL3VhcGkvbGludXgvZGV2bGluay5oIC0gTmV0d29yayBwaHlz
aWNhbCBkZXZpY2UgTmV0bGluawo+IGludGVyZmFjZSwKPiBBY3R1YWxseSBub3QsIEkgdGhpbmsg
dGhlcmUgdXNlZCB0byBoYXZlIHNvbWUgZGlzY3Vzc2lvbiBsYXN0IHllYXIgYW5kIHRoZQo+IGNv
bmNsdXNpb24gaXMgdG8gcmVtb3ZlIHRoaXMgY29tbWVudC4KPgo+IFsuLi5dCj4KPj4gWWVzLCBi
dXQgaXQgY291bGQgYmUgaGFyZC4gRS5nIHZEUEEgd2lsbCBjaG9zZSB0byB1c2UgZGV2bGluayAo
dGhlcmUncyBhIGxvbmcgZGViYXRlIG9uIHN5c2ZzIHZzIGRldmxpbmspLiBTbyBpZiB3ZSBnbyB3
aXRoIHN5c2ZzLCBhdCBsZWFzdCB0d28gQVBJcyBuZWVkcyB0byBiZSBzdXBwb3J0ZWQgLi4uCj4g
V2UgaGFkIGludGVybmFsIGRpc2N1c3Npb24gYW5kIHByb3Bvc2FsIG9uIHRoaXMgdG9waWMuCj4g
SSB3YW50ZWQgRWxpIENvaGVuIHRvIGJlIGJhY2sgZnJvbSB2YWNhdGlvbiBvbiBXZWQgOC8xOSwg
YnV0IHNpbmNlIHRoaXMgaXMgYWN0aXZlIGRpc2N1c3Npb24gcmlnaHQgbm93LCBJIHdpbGwgc2hh
cmUgdGhlIHRob3VnaHRzIGFueXdheS4KPgo+IEhlcmUgYXJlIHRoZSBpbml0aWFsIHJvdW5kIG9m
IHRob3VnaHRzIGFuZCBwcm9wb3NhbC4KPgo+IFVzZXIgcmVxdWlyZW1lbnRzOgo+IC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQo+IDEuIFVzZXIgbWlnaHQgd2FudCB0byBjcmVhdGUgb25lIG9y
IG1vcmUgdmRwYSBkZXZpY2VzIHBlciBQQ0kgUEYvVkYvU0YuCj4gMi4gVXNlciBtaWdodCB3YW50
IHRvIGNyZWF0ZSBvbmUgb3IgbW9yZSB2ZHBhIGRldmljZXMgb2YgdHlwZSBuZXQvYmxrIG9yIG90
aGVyIHR5cGUuCj4gMy4gVXNlciBuZWVkcyB0byBsb29rIGFuZCBkdW1wIGF0IHRoZSBoZWFsdGgg
b2YgdGhlIHF1ZXVlcyBmb3IgZGVidWcgcHVycG9zZS4KPiA0LiBEdXJpbmcgdmRwYSBuZXQgZGV2
aWNlIGNyZWF0aW9uIHRpbWUsIHVzZXIgbWF5IGhhdmUgdG8gcHJvdmlkZSBhIE1BQyBhZGRyZXNz
IGFuZC9vciBWTEFOLgo+IDUuIFVzZXIgc2hvdWxkIGJlIGFibGUgdG8gc2V0L3F1ZXJ5IHNvbWUg
b2YgdGhlIGF0dHJpYnV0ZXMgZm9yIGRlYnVnL2NvbXBhdGliaWxpdHkgY2hlY2sKPiA2LiBXaGVu
IHVzZXIgd2FudHMgdG8gY3JlYXRlIHZkcGEgZGV2aWNlLCBpdCBuZWVkcyB0byBrbm93IHdoaWNo
IGRldmljZSBzdXBwb3J0cyBjcmVhdGlvbi4KPiA3LiBVc2VyIHNob3VsZCBiZSBhYmxlIHRvIHNl
ZSB0aGUgcXVldWUgc3RhdGlzdGljcyBvZiBkb29yYmVsbHMsIHdxZXMgZXRjIHJlZ2FyZGxlc3Mg
b2YgY2xhc3MgdHlwZQoKCk5vdGUgdGhhdCB3cWVzIGlzIHByb2JhYmx5IG5vdCBzb21ldGhpbmcg
Y29tbW9uIGluIGFsbCBvZiB0aGUgdmVuZG9ycy4KCgo+Cj4gVG8gYWRkcmVzcyBhYm92ZSByZXF1
aXJlbWVudHMsIHRoZXJlIGlzIGEgbmVlZCBvZiB2ZW5kb3IgYWdub3N0aWMgdG9vbCwgc28gdGhh
dCB1c2VyIGNhbiBjcmVhdGUvY29uZmlnL2RlbGV0ZSB2ZHBhIGRldmljZShzKSByZWdhcmRsZXNz
IG9mIHRoZSB2ZW5kb3IuCj4KPiBIZW5jZSwKPiBXZSBzaG91bGQgaGF2ZSBhIHRvb2wgdGhhdCBs
ZXRzIHVzZXIgZG8gaXQuCj4KPiBFeGFtcGxlczoKPiAtLS0tLS0tLS0tLS0tCj4gKGEpIExpc3Qg
cGFyZW50IGRldmljZXMgd2hpY2ggc3VwcG9ydHMgY3JlYXRpbmcgdmRwYSBkZXZpY2VzLgo+IEl0
IGFsc28gc2hvd3Mgd2hpY2ggY2xhc3MgdHlwZXMgc3VwcG9ydGVkIGJ5IHRoaXMgcGFyZW50IGRl
dmljZS4KPiBJbiBiZWxvdyBjb21tYW5kIHR3byBwYXJlbnQgZGV2aWNlcyBzdXBwb3J0IHZkcGEg
ZGV2aWNlIGNyZWF0aW9uLgo+IEZpcnN0IGlzIFBDSSBWRiB3aG9zZSBiZGYgaXMgMDMuMDA6NS4K
PiBTZWNvbmQgaXMgUENJIFNGIHdob3NlIG5hbWUgaXMgbWx4NV9zZi4xCj4KPiAkIHZkcGEgbGlz
dCBwZAoKCldoYXQgZGlkICJwZCIgbWVhbj8KCgo+IHBjaS8wMDAwOjAzLjAwOjUKPiAgICBjbGFz
c19zdXBwb3J0cwo+ICAgICAgbmV0IHZkcGEKPiB2aXJ0YnVzL21seDVfc2YuMQoKClNvIGNyZWF0
aW5nIG1seDVfc2YuMSBpcyB0aGUgY2hhcmdlIG9mIGRldmxpbms/CgoKPiAgICBjbGFzc19zdXBw
b3J0cwo+ICAgICAgbmV0Cj4KPiAoYikgTm93IGFkZCBhIHZkcGEgZGV2aWNlIGFuZCBzaG93IHRo
ZSBkZXZpY2UuCj4gJCB2ZHBhIGRldiBhZGQgcGNpLzAwMDA6MDMuMDA6NSB0eXBlIG5ldAoKClNv
IGlmIHlvdSB3YW50IHRvIGNyZWF0ZSBkZXZpY2VzIHR5cGVzIG90aGVyIHRoYW4gdmRwYSBvbiAK
cGNpLzAwMDA6MDMuMDA6NSBpdCBuZWVkcyBzb21lIHN5bmNocm9uaXphdGlvbiB3aXRoIGRldmxp
bms/CgoKPiAkIHZkcGEgZGV2IHNob3cKPiB2ZHBhMEBwY2kvMDAwMDowMy4wMDo1IHR5cGUgbmV0
IHN0YXRlIGluYWN0aXZlIG1heHF1ZXVlcyA4IGN1cnF1ZXVlcyA0Cj4KPiAoYykgdmRwYSBkZXYg
c2hvdyBmZWF0dXJlcyB2ZHBhMAo+IGlvbW11IHBsYXRmb3JtCj4gdmVyc2lvbiAxCj4KPiAoZCkg
ZHVtcCB2ZHBhIHN0YXRpc3RpY3MKPiAkIHZkcGEgZGV2IHN0YXRzIHNob3cgdmRwYTAKPiBraWNr
ZG9vcmJlbGxzIDEwCj4gd3FlcyAxMDAKPgo+IChlKSBOb3cgZGVsZXRlIGEgdmRwYSBkZXZpY2Ug
cHJldmlvdXNseSBjcmVhdGVkLgo+ICQgdmRwYSBkZXYgZGVsIHZkcGEwCj4KPiBEZXNpZ24gb3Zl
cnZpZXc6Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAxLiBBYm92ZSBleGFtcGxlIHRvb2wg
cnVucyBvdmVyIG5ldGxpbmsgc29ja2V0IGludGVyZmFjZS4KPiAyLiBUaGlzIGVuYWJsZXMgdXNl
cnMgdG8gcmV0dXJuIG1lYW5pbmdmdWwgZXJyb3Igc3RyaW5ncyBpbiBhZGRpdGlvbiB0byBjb2Rl
IHNvIHRoYXQgdXNlciBjYW4gYmUgbW9yZSBpbmZvcm1lZC4KPiBPZnRlbiB0aGlzIGlzIG1pc3Np
bmcgaW4gaW9jdGwoKS9jb25maWdmcy9zeXNmcyBpbnRlcmZhY2VzLgo+IDMuIFRoaXMgdG9vbCBv
dmVyIG5ldGxpbmsgZW5hYmxlcyBzeXNjYWxsZXIgdGVzdHMgdG8gYmUgbW9yZSB1c2FibGUgbGlr
ZSBvdGhlciBzdWJzeXN0ZW1zIHRvIGtlZXAga2VybmVsIHJvYnVzdAo+IDQuIFRoaXMgcHJvdmlk
ZXMgdmVuZG9yIGFnbm9zdGljIHZpZXcgb2YgYWxsIHZkcGEgY2FwYWJsZSBwYXJlbnQgYW5kIHZk
cGEgZGV2aWNlcy4KPgo+IDUuIEVhY2ggZHJpdmVyIHdoaWNoIHN1cHBvcnRzIHZkcGEgZGV2aWNl
IGNyZWF0aW9uLCByZWdpc3RlcnMgdGhlIHBhcmVudCBkZXZpY2UgYWxvbmcgd2l0aCBzdXBwb3J0
ZWQgY2xhc3Nlcy4KPgo+IEZBUXM6Cj4gLS0tLS0tLS0KPiAxLiBXaHkgbm90IHVzaW5nIGRldmxp
bms/Cj4gQW5zOiBCZWNhdXNlIGFzIHZkcGEgZWNobyBzeXN0ZW0gZ3Jvd3MsIGRldmxpbmsgd2ls
bCBmYWxsIHNob3J0IG9mIGV4dGVuZGluZyB2ZHBhIHNwZWNpZmljIHBhcmFtcywgYXR0cmlidXRl
cywgc3RhdHMuCgoKVGhpcyBzaG91bGQgYmUgZmluZSBidXQgaXQncyBzdGlsbCBub3QgY2xlYXIg
dG8gbWUgdGhlIGRpZmZlcmVuY2UgCmJldHdlZW4gYSB2ZHBhIG5ldGxpbmsgYW5kIGEgdmRwYSBv
YmplY3QgaW4gZGV2bGluay4KClRoYW5rcwoKCj4KPiAyLiBXaHkgbm90IHVzZSBzeXNmcz8KPiBB
bnM6Cj4gKGEpIEJlY2F1c2UgcnVubmluZyBzeXNjYWxsZXIgaW5mcmFzdHJ1Y3R1cmUgY2FuIHJ1
biB3ZWxsIG92ZXIgbmV0bGluayBzb2NrZXRzIGxpa2UgaXQgcnVucyBmb3Igc2V2ZXJhbCBzdWJz
eXN0ZW0uCj4gKGIpIGl0IGxhY2tzIHRoZSBhYmlsaXR5IHRvIHJldHVybiBlcnJvciBtZXNzYWdl
cy4gRG9pbmcgdmlhIGtlcm5lbCBsb2cgaXMganVzdCBkb2Vzbid0IHdvcmsuCj4gKGMpIFdoeSBu
b3QgdXNpbmcgc29tZSBpb2N0bCgpPyBJdCB3aWxsIHJlaW52ZW50IHRoZSB3aGVlbCBvZiBuZXRs
aW5rIHRoYXQgaGFzIFRMViBmb3JtYXRzIGZvciBzZXZlcmFsIGF0dHJpYnV0ZXMuCj4KPiAzLiBX
aHkgbm90IGNvbmZpZ3M/Cj4gSXQgZm9sbG93cyBzYW1lIGxpbWl0YXRpb24gYXMgdGhhdCBvZiBz
eXNmcy4KPgo+IExvdyBsZXZlbCBkZXNpZ24gYW5kIGRyaXZlciBBUElTOgo+IC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gV2lsbCBwb3N0IG9uY2Ugd2UgZGlz
Y3VzcyB0aGlzIGZ1cnRoZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2ludGVsLWd2dC1kZXYK
