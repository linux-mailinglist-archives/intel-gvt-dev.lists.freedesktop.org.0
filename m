Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E494E249988
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 19 Aug 2020 11:42:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A82BC89B00;
	Wed, 19 Aug 2020 09:42:06 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2903089B00
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 19 Aug 2020 09:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597830124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=krA6GwoXETvw/+Dx+bQg8FPzweKaKAhvXBzivf1bST0=;
 b=I5d0D2IwQdGPP3LQqsTddkCh0cozeiKInuN3ldIx6tGlRSEraTAqRwPV2ewJFB/ucG0jCG
 75H6KtRfapuXUcC80jhOfWtbrjurxKGQJKQqA1ce50gWjbsoMbs6WX4KYH+2761ATQ0JNP
 wN7sP9HUabfLSUtgCK6WWZVjaeaNkeg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-eW0SMPrGMC2JFTmteODetA-1; Wed, 19 Aug 2020 05:42:01 -0400
X-MC-Unique: eW0SMPrGMC2JFTmteODetA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F37D5186A56E;
 Wed, 19 Aug 2020 09:41:58 +0000 (UTC)
Received: from [10.72.13.88] (ovpn-13-88.pek2.redhat.com [10.72.13.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD78D7B90C;
 Wed, 19 Aug 2020 09:41:40 +0000 (UTC)
Subject: Re: device compatibility interface for live migration with assigned
 devices
To: Parav Pandit <parav@nvidia.com>, Yan Zhao <yan.y.zhao@intel.com>
References: <20200805105319.GF2177@nanopsycho>
 <20200810074631.GA29059@joy-OptiPlex-7040>
 <e6e75807-0614-bd75-aeb6-64d643e029d3@redhat.com>
 <20200814051601.GD15344@joy-OptiPlex-7040>
 <a51209fe-a8c6-941f-ff54-7be06d73bc44@redhat.com>
 <20200818085527.GB20215@redhat.com>
 <3a073222-dcfe-c02d-198b-29f6a507b2e1@redhat.com>
 <20200818091628.GC20215@redhat.com>
 <20200818113652.5d81a392.cohuck@redhat.com>
 <BY5PR12MB4322C9D1A66C4657776A1383DC5C0@BY5PR12MB4322.namprd12.prod.outlook.com>
 <20200819033035.GA21172@joy-OptiPlex-7040>
 <BY5PR12MB43226CABD003285D0C77E2B7DC5D0@BY5PR12MB4322.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <b766fa9c-ed53-b6be-9c2b-ea8bbe85967b@redhat.com>
Date: Wed, 19 Aug 2020 17:41:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <BY5PR12MB43226CABD003285D0C77E2B7DC5D0@BY5PR12MB4322.namprd12.prod.outlook.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
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
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Jiri Pirko <jiri@mellanox.com>,
 "dinechin@redhat.com" <dinechin@redhat.com>,
 "devel@ovirt.org" <devel@ovirt.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Ck9uIDIwMjAvOC8xOSDkuIvljYgxOjU4LCBQYXJhdiBQYW5kaXQgd3JvdGU6Cj4KPj4gRnJvbTog
WWFuIFpoYW8gPHlhbi55LnpoYW9AaW50ZWwuY29tPgo+PiBTZW50OiBXZWRuZXNkYXksIEF1Z3Vz
dCAxOSwgMjAyMCA5OjAxIEFNCj4+IE9uIFR1ZSwgQXVnIDE4LCAyMDIwIGF0IDA5OjM5OjI0QU0g
KzAwMDAsIFBhcmF2IFBhbmRpdCB3cm90ZToKPj4+IFBsZWFzZSByZWZlciB0byBteSBwcmV2aW91
cyBlbWFpbCB3aGljaCBoYXMgbW9yZSBleGFtcGxlIGFuZCBkZXRhaWxzLgo+PiBoaSBQYXJhdiwK
Pj4gdGhlIGV4YW1wbGUgaXMgYmFzZWQgb24gYSBuZXcgdmRwYSB0b29sIHJ1bm5pbmcgb3ZlciBu
ZXRsaW5rLCBub3QgYmFzZWQgb24KPj4gZGV2bGluaywgcmlnaHQ/Cj4gUmlnaHQuCj4KPj4gRm9y
IHZmaW8gbWlncmF0aW9uIGNvbXBhdGliaWxpdHksIHdlIGhhdmUgdG8gZGVhbCB3aXRoIGJvdGgg
bWRldiBhbmQgcGh5c2ljYWwKPj4gcGNpIGRldmljZXMsIEkgZG9uJ3QgdGhpbmsgaXQncyBhIGdv
b2QgaWRlYSB0byB3cml0ZSBhIG5ldyB0b29sIGZvciBpdCwgZ2l2ZW4gd2UgYXJlCj4+IGFibGUg
dG8gcmV0cmlldmUgdGhlIHNhbWUgaW5mbyBmcm9tIHN5c2ZzIGFuZCB0aGVyZSdzIGFscmVhZHkg
YW4gbWRldmN0bCBmcm9tCj4gbWRldiBhdHRyaWJ1dGUgc2hvdWxkIGJlIHZpc2libGUgaW4gdGhl
IG1kZXYncyBzeXNmcyB0cmVlLgo+IEkgZG8gbm90IHByb3Bvc2UgdG8gd3JpdGUgYSBuZXcgbWRl
diB0b29sIG92ZXIgbmV0bGluay4gSSBhbSBzb3JyeSBpZiBJIGltcGxpZWQgdGhhdCB3aXRoIG15
IHN1Z2dlc3Rpb24gb2YgdmRwYSB0b29sLgo+Cj4gSWYgdW5kZXJseWluZyBkZXZpY2UgaXMgdmRw
YSwgbWRldiBtaWdodCBiZSBhYmxlIHRvIHVuZGVyc3RhbmQgdmRwYSBkZXZpY2UgYW5kIHF1ZXJ5
IGZyb20gaXQgYW5kIHBvcHVsYXRlIGluIG1kZXYgc3lzZnMgdHJlZS4KCgpOb3RlIHRoYXQgdmRw
YSBpcyBidXMgaW5kZXBlbmRlbnQgc28gaXQgY2FuJ3Qgd29yayBub3cgYW5kIHRoZSBzdXBwb3J0
IApvZiBtZGV2IG9uIHRvcCBvZiB2RFBBIGhhdmUgYmVlbiByZWplY3RlZCAoYW5kIGR1cGxpY2F0
ZWQgd2l0aCB2aG9zdC12RFBBKS4KClRoYW5rcwoKCj4KPiBUaGUgdmRwYSB0b29sIEkgcHJvcG9z
ZSBpcyB1c2FibGUgZXZlbiB3aXRob3V0IG1kZXZzLgo+IHZkcGEgdG9vbCdzIHJvbGUgaXMgdG8g
Y3JlYXRlIG9uZSBvciBtb3JlIHZkcGEgZGV2aWNlcyBhbmQgcGxhY2Ugb24gdGhlICJ2ZHBhIiBi
dXMgd2hpY2ggaXMgdGhlIGxvd2VzdCBsYXllciBoZXJlLgo+IEFkZGl0aW9uYWxseSB0aGlzIHRv
b2wgbGV0IHVzZXIgcXVlcnkgdmlydHF1ZXVlIHN0YXRzLCBkYiBzdGF0cy4KPiBXaGVuIGEgdXNl
ciBjcmVhdGVzIHZkcGEgbmV0IGRldmljZSwgdXNlciBtYXkgbmVlZCB0byBjb25maWd1cmUgZmVh
dHVyZXMgb2YgdGhlIHZkcGEgZGV2aWNlIHN1Y2ggYXMgVklSVElPX05FVF9GX01BQywgZGVmYXVs
dCBWSVJUSU9fTkVUX0ZfTVRVLgo+IFRoZXNlIGFyZSB2ZHBhIGxldmVsIGZlYXR1cmVzLCBhdHRy
aWJ1dGVzLiBNZGV2IGlzIGxheWVyIGFib3ZlIGl0Lgo+Cj4+IEFsZXgKPj4gKGh0dHBzOi8vbmFt
MDMuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmdp
dGh1Yi4KPj4gY29tJTJGbWRldmN0bCUyRm1kZXZjdGwmYW1wO2RhdGE9MDIlN0MwMSU3Q3BhcmF2
JTQwbnZpZGlhLmNvbSU3Qwo+PiAwYzI2OTFkNDMwMzA0ZjVlYTExMzA4ZDg0M2YyZDg0ZSU3QzQz
MDgzZDE1NzI3MzQwYzFiN2RiMzllZmQ5Y2NjMTcKPj4gYSU3QzAlN0MwJTdDNjM3MzM0MDU3NTcx
OTExMzU3JmFtcDtzZGF0YT1LeEg3UHd4bUt5eTlKT0R1dDhCV3IKPj4gTFF5T0J5bFcwMCUyRnl6
YzRyRXZqVXZBJTNEJmFtcDtyZXNlcnZlZD0wKS4KPj4KPiBTb3JyeSBmb3IgYWJvdmUgbGluayBt
YW5nbGluZy4gT3VyIG1haWwgc2VydmVyIGlzIHN0aWxsIHRyYW5zaXRpb25pbmcgZHVlIHRvIGNv
bXBhbnkgYWNxdWlzaXRpb24uCj4KPiBJIGFtIGxlc3MgZmFtaWxpYXIgb24gYmVsb3cgcG9pbnRz
IHRvIGNvbW1lbnQuCj4KPj4gaGkgQWxsLAo+PiBjb3VsZCB3ZSBkZWNpZGUgdGhhdCBzeXNmcyBp
cyB0aGUgaW50ZXJmYWNlIHRoYXQgZXZlcnkgVkZJTyB2ZW5kb3IgZHJpdmVyIG5lZWRzCj4+IHRv
IHByb3ZpZGUgaW4gb3JkZXIgdG8gc3VwcG9ydCB2ZmlvIGxpdmUgbWlncmF0aW9uLCBvdGhlcndp
c2UgdGhlIHVzZXJzcGFjZQo+PiBtYW5hZ2VtZW50IHRvb2wgd291bGQgbm90IGxpc3QgdGhlIGRl
dmljZSBpbnRvIHRoZSBjb21wYXRpYmxlIGxpc3Q/Cj4+Cj4+IGlmIHRoYXQncyB0cnVlLCBsZXQn
cyBtb3ZlIHRvIHRoZSBzdGFuZGFyZGl6aW5nIG9mIHRoZSBzeXNmcyBpbnRlcmZhY2UuCj4+ICgx
KSBjb250ZW50Cj4+IGNvbW1vbiBwYXJ0OiAobXVzdCkKPj4gICAgIC0gc29mdHdhcmVfdmVyc2lv
bjogKGluIG1ham9yLm1pbm9yLmJ1Z2ZpeCBzY2hlbWUpCj4+ICAgICAtIGRldmljZV9hcGk6IHZm
aW8tcGNpIG9yIHZmaW8tY2N3IC4uLgo+PiAgICAgLSB0eXBlOiBtZGV2IHR5cGUgZm9yIG1kZXYg
ZGV2aWNlIG9yCj4+ICAgICAgICAgICAgIGEgc2lnbmF0dXJlIGZvciBwaHlzaWNhbCBkZXZpY2Ug
d2hpY2ggaXMgYSBjb3VudGVycGFydCBmb3IKPj4gCSAgIG1kZXYgdHlwZS4KPj4KPj4gZGV2aWNl
IGFwaSBzcGVjaWZpYyBwYXJ0OiAobXVzdCkKPj4gICAgLSBwY2kgaWQ6IHBjaSBpZCBvZiBtZGV2
IHBhcmVudCBkZXZpY2Ugb3IgcGNpIGlkIG9mIHBoeXNpY2FsIHBjaQo+PiAgICAgIGRldmljZSAo
ZGV2aWNlX2FwaSBpcyB2ZmlvLXBjaSkKPj4gICAgLSBzdWJjaGFubmVsX3R5cGUgKGRldmljZV9h
cGkgaXMgdmZpby1jY3cpCj4+Cj4+IHZlbmRvciBkcml2ZXIgc3BlY2lmaWMgcGFydDogKG9wdGlv
bmFsKQo+PiAgICAtIGFnZ3JlZ2F0b3IKPj4gICAgLSBjaHBpZF90eXBlCj4+ICAgIC0gcmVtb3Rl
X3VybAo+Pgo+PiBOT1RFOiB2ZW5kb3JzIGFyZSBmcmVlIHRvIGFkZCBhdHRyaWJ1dGVzIGluIHRo
aXMgcGFydCB3aXRoIGEgcmVzdHJpY3Rpb24gdGhhdCB0aGlzCj4+IGF0dHJpYnV0ZSBpcyBhYmxl
IHRvIGJlIGNvbmZpZ3VyZWQgd2l0aCB0aGUgc2FtZSBuYW1lIGluIHN5c2ZzIHRvby4gZS5nLgo+
PiBmb3IgYWdncmVnYXRvciwgdGhlcmUgbXVzdCBiZSBhIHN5c2ZzIGF0dHJpYnV0ZSBpbiBkZXZp
Y2Ugbm9kZQo+PiAvc3lzL2RldmljZXMvcGNpMDAwMDowMC8wMDAwOjAwOjAyLjAvODgyY2M0ZGEt
ZGVkZS0xMWU3LTkxODAtCj4+IDA3OGE2MjA2M2FiMS9pbnRlbF92Z3B1L2FnZ3JlZ2F0b3IsCj4+
IHNvIHRoYXQgdGhlIHVzZXJzcGFjZSB0b29sIGlzIGFibGUgdG8gY29uZmlndXJlIHRoZSB0YXJn
ZXQgZGV2aWNlIGFjY29yZGluZyB0bwo+PiBzb3VyY2UgZGV2aWNlJ3MgYWdncmVnYXRvciBhdHRy
aWJ1dGUuCj4+Cj4+Cj4+ICgyKSB3aGVyZSBhbmQgc3RydWN0dXJlCj4+IHByb3Bvc2FsIDE6Cj4+
IHwtIFtwYXRoIHRvIGRldmljZV0KPj4gICAgfC0tLSBtaWdyYXRpb24KPj4gICAgfCAgICAgfC0t
LSBzZWxmCj4+ICAgIHwgICAgIHwgICAgfC1zb2Z0d2FyZV92ZXJzaW9uCj4+ICAgIHwgICAgIHwg
ICAgfC1kZXZpY2VfYXBpCj4+ICAgIHwgICAgIHwgICAgfC10eXBlCj4+ICAgIHwgICAgIHwgICAg
fC1bcGNpX2lkIG9yIHN1YmNoYW5uZWxfdHlwZV0KPj4gICAgfCAgICAgfCAgICB8LTxhZ2dyZWdh
dG9yIG9yIGNocGlkX3R5cGU+Cj4+ICAgIHwgICAgIHwtLS0gY29tcGF0aWJsZQo+PiAgICB8ICAg
ICB8ICAgIHwtc29mdHdhcmVfdmVyc2lvbgo+PiAgICB8ICAgICB8ICAgIHwtZGV2aWNlX2FwaQo+
PiAgICB8ICAgICB8ICAgIHwtdHlwZQo+PiAgICB8ICAgICB8ICAgIHwtW3BjaV9pZCBvciBzdWJj
aGFubmVsX3R5cGVdCj4+ICAgIHwgICAgIHwgICAgfC08YWdncmVnYXRvciBvciBjaHBpZF90eXBl
Pgo+PiBtdWx0aXBsZSBjb21wYXRpYmxlIGlzIGFsbG93ZWQuCj4+IGF0dHJpYnV0ZXMgc2hvdWxk
IGJlIEFTQ0lJIHRleHQgZmlsZXMsIHByZWZlcmFibHkgd2l0aCBvbmx5IG9uZSB2YWx1ZSBwZXIg
ZmlsZS4KPj4KPj4KPj4gcHJvcG9zYWwgMjogdXNlIGJpbl9hdHRyaWJ1dGUuCj4+IHwtIFtwYXRo
IHRvIGRldmljZV0KPj4gICAgfC0tLSBtaWdyYXRpb24KPj4gICAgfCAgICAgfC0tLSBzZWxmCj4+
ICAgIHwgICAgIHwtLS0gY29tcGF0aWJsZQo+Pgo+PiBzbyB3ZSBjYW4gY29udGludWUgdXNlIG11
bHRpbGluZSBmb3JtYXQuIGUuZy4KPj4gY2F0IGNvbXBhdGlibGUKPj4gICAgc29mdHdhcmVfdmVy
c2lvbj0wLjEuMAo+PiAgICBkZXZpY2VfYXBpPXZmaW9fcGNpCj4+ICAgIHR5cGU9aTkxNS1HVlRn
X1Y1X3t2YWwxOmludDoxLDIsNCw4fQo+PiAgICBwY2lfaWQ9ODA4NjU5NjMKPj4gICAgYWdncmVn
YXRvcj17dmFsMX0vMgo+Pgo+PiBUaGFua3MKPj4gWWFuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRl
bC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXYK
