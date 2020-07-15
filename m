Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 197E9220657
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 15 Jul 2020 09:37:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B771889144;
	Wed, 15 Jul 2020 07:37:32 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49C289144
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 15 Jul 2020 07:37:31 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id k23so1215550iom.10
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 15 Jul 2020 00:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DumU2ET9UORrWVL+VVVe0K08IiXi9cXzRB/5KX9fT3k=;
 b=FQv117ihUkI66ANT7jlgxGWBfTnqj3JrZiqvGW9/Y2OXZNdQp0t6vlXMxnny2mMBQx
 TRUf9129cKMr/vEDxDR5HsGAsM2pS87M6PeWdLhyEhWRGh07zmcCi6tUyto3eR3q8z4w
 LC5U+kq6YvWHZw5cevqGpAu+YBAR/5MhOy8YGtk8x5iEIhx/RjUv+iDi5bzVQKWR0kH2
 tm02tPojJlPGUouvZGYAXTX9UoKCEasKpZln6a+7MQmf6Uap4L0IXh+VsrIVgGTft12I
 6mzw83koIU/XPVTCzaszLqGxN07oo8Dp7RzBFgcrNt7wfcCMXdN4bu7Z9OyFy6ASN127
 42IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DumU2ET9UORrWVL+VVVe0K08IiXi9cXzRB/5KX9fT3k=;
 b=N5ycJ26Hr3k9shcA0xa40rut0rewv2ZKczhBHWd6FMFIV+VDDddaUV79y+u9GkVBYn
 8rtwxhxLFxhE3z9n2Q99kJUcOJwevH/OW2guaKLAECXDP138yB6038cynObtTNpO/izb
 3ZS0p0qba/AfRCTjZtCjK13CjiSZzDuEOB8ufvZALV9gLcfeK8X1wPdTFB4hQ2u5xexl
 VUZZ8BbVsSwI/KsVczUtMTtOolEC6Vz02qbcKCYnTJmlVBxDMXX+iujuj2MXGw3FPOa6
 1tg751PtGqR3J2TW4kErea7pFwfsTWWQVGEhBHTkRCIQX5TWqvvU7TdK7RTZSZcZ8pPG
 4YOA==
X-Gm-Message-State: AOAM530iJEnIO5BB9TYVIdRDUqUHHhfe+IIpDRVyMTr+66/Eaw5bDE8n
 cvWdIbxTY4WQic4Ahjx+keFVTDCxgbvn6+cG/Yw=
X-Google-Smtp-Source: ABdhPJz1LRtXByq885/kGyA6lH37zYT1O5Yr6fkbcgXO+44OsDyppByx0liKlB5+4sgHYFaY9g2yqyO7m8u3PCIqv5Y=
X-Received: by 2002:a5e:dd0a:: with SMTP id t10mr8626464iop.80.1594798650303; 
 Wed, 15 Jul 2020 00:37:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200713232957.GD5955@joy-OptiPlex-7040>
 <20200714102129.GD25187@redhat.com>
 <20200714101616.5d3a9e75@x1.home> <20200714171946.GL2728@work-vm>
 <20200714145948.17b95eb3@x1.home>
In-Reply-To: <20200714145948.17b95eb3@x1.home>
From: Alex Xu <soulxu@gmail.com>
Date: Wed, 15 Jul 2020 15:37:19 +0800
Message-ID: <CAH7mGatPWsczh_rbVhx4a+psJXvkZgKou3r5HrEQTqE7SqZkKA@mail.gmail.com>
Subject: Re: device compatibility interface for live migration with assigned
 devices
To: Alex Williamson <alex.williamson@redhat.com>
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
Cc: kvm@vger.kernel.org, libvir-list@redhat.com, qemu-devel@nongnu.org,
 kwankhede@nvidia.com, eauger@redhat.com, "Wang,
 Xin-ran" <xin-ran.wang@intel.com>, corbet@lwn.net, devel@ovirt.org,
 openstack-discuss <openstack-discuss@lists.openstack.org>,
 shaohe.feng@intel.com, kevin.tian@intel.com, Yan Zhao <yan.y.zhao@intel.com>,
 eskultet@redhat.com, "Ding, Jian-feng" <jian-feng.ding@intel.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, zhenyuw@linux.intel.com, "Xu,
 Hejie" <hejie.xu@intel.com>, bao.yumeng@zte.com.cn,
 Sean Mooney <smooney@redhat.com>, intel-gvt-dev@lists.freedesktop.org,
 cohuck@redhat.com, dinechin@redhat.com
Content-Type: multipart/mixed; boundary="===============0204143267=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--===============0204143267==
Content-Type: multipart/alternative; boundary="0000000000000a2d9205aa75ff0b"

--0000000000000a2d9205aa75ff0b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alex Williamson <alex.williamson@redhat.com> =E4=BA=8E2020=E5=B9=B47=E6=9C=
=8815=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8A=E5=8D=885:00=E5=86=99=E9=81=93=
=EF=BC=9A

> On Tue, 14 Jul 2020 18:19:46 +0100
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
>
> > * Alex Williamson (alex.williamson@redhat.com) wrote:
> > > On Tue, 14 Jul 2020 11:21:29 +0100
> > > Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> > >
> > > > On Tue, Jul 14, 2020 at 07:29:57AM +0800, Yan Zhao wrote:
> > > > > hi folks,
> > > > > we are defining a device migration compatibility interface that
> helps upper
> > > > > layer stack like openstack/ovirt/libvirt to check if two devices
> are
> > > > > live migration compatible.
> > > > > The "devices" here could be MDEVs, physical devices, or hybrid of
> the two.
> > > > > e.g. we could use it to check whether
> > > > > - a src MDEV can migrate to a target MDEV,
> > > > > - a src VF in SRIOV can migrate to a target VF in SRIOV,
> > > > > - a src MDEV can migration to a target VF in SRIOV.
> > > > >   (e.g. SIOV/SRIOV backward compatibility case)
> > > > >
> > > > > The upper layer stack could use this interface as the last step t=
o
> check
> > > > > if one device is able to migrate to another device before
> triggering a real
> > > > > live migration procedure.
> > > > > we are not sure if this interface is of value or help to you.
> please don't
> > > > > hesitate to drop your valuable comments.
> > > > >
> > > > >
> > > > > (1) interface definition
> > > > > The interface is defined in below way:
> > > > >
> > > > >              __    userspace
> > > > >               /\              \
> > > > >              /                 \write
> > > > >             / read              \
> > > > >    ________/__________       ___\|/_____________
> > > > >   | migration_version |     | migration_version |-->check migrati=
on
> > > > >   ---------------------     ---------------------   compatibility
> > > > >      device A                    device B
> > > > >
> > > > >
> > > > > a device attribute named migration_version is defined under each
> device's
> > > > > sysfs node. e.g.
> (/sys/bus/pci/devices/0000\:00\:02.0/$mdev_UUID/migration_version).
> > > > > userspace tools read the migration_version as a string from the
> source device,
> > > > > and write it to the migration_version sysfs attribute in the
> target device.
> > > > >
> > > > > The userspace should treat ANY of below conditions as two devices
> not compatible:
> > > > > - any one of the two devices does not have a migration_version
> attribute
> > > > > - error when reading from migration_version attribute of one devi=
ce
> > > > > - error when writing migration_version string of one device to
> > > > >   migration_version attribute of the other device
> > > > >
> > > > > The string read from migration_version attribute is defined by
> device vendor
> > > > > driver and is completely opaque to the userspace.
> > > > > for a Intel vGPU, string format can be defined like
> > > > > "parent device PCI ID" + "version of gvt driver" + "mdev type" +
> "aggregator count".
> > > > >
> > > > > for an NVMe VF connecting to a remote storage. it could be
> > > > > "PCI ID" + "driver version" + "configured remote storage URL"
> > > > >
> > > > > for a QAT VF, it may be
> > > > > "PCI ID" + "driver version" + "supported encryption set".
> > > > >
> > > > > (to avoid namespace confliction from each vendor, we may prefix a
> driver name to
> > > > > each migration_version string. e.g.
> i915-v1-8086-591d-i915-GVTg_V5_8-1)
> > >
> > > It's very strange to define it as opaque and then proceed to describe
> > > the contents of that opaque string.  The point is that its contents
> > > are defined by the vendor driver to describe the device, driver
> version,
> > > and possibly metadata about the configuration of the device.  One
> > > instance of a device might generate a different string from another.
> > > The string that a device produces is not necessarily the only string
> > > the vendor driver will accept, for example the driver might support
> > > backwards compatible migrations.
> >
> > (As I've said in the previous discussion, off one of the patch series)
> >
> > My view is it makes sense to have a half-way house on the opaqueness of
> > this string; I'd expect to have an ID and version that are human
> > readable, maybe a device ID/name that's human interpretable and then a
> > bunch of other cruft that maybe device/vendor/version specific.
> >
> > I'm thinking that we want to be able to report problems and include the
> > string and the user to be able to easily identify the device that was
> > complaining and notice a difference in versions, and perhaps also use
> > it in compatibility patterns to find compatible hosts; but that does
> > get tricky when it's a 'ask the device if it's compatible'.
>
> In the reply I just sent to Dan, I gave this example of what a
> "compatibility string" might look like represented as json:
>
> {
>   "device_api": "vfio-pci",
>   "vendor": "vendor-driver-name",
>   "version": {
>     "major": 0,
>     "minor": 1
>   },
>

The OpenStack Placement service doesn't support to filtering the target
host by the semver syntax, altough we can code this filtering logic inside
scheduler filtering by python code. Basically, placement only supports
filtering the host by traits (it is same thing with labels, tags). The nova
scheduler will call the placement service to filter the hosts first, then
go through all the scheduler filters. That would be great if the placement
service can filter out more hosts which isn't compatible first, and then it
is better.


>   "vfio-pci": { // Based on above device_api
>     "vendor": 0x1234, // Values for the exposed device
>     "device": 0x5678,
>       // Possibly further parameters for a more specific match
>   },
>

OpenStack already based on vendor and device id to separate the devices
into the different resource pool, then the scheduler based on that to filer
the hosts, so I think it needn't be the part of this compatibility string.


>   "mdev_attrs": [
>     { "attribute0": "VALUE" }
>   ]
> }
>
> Are you thinking that we might allow the vendor to include a vendor
> specific array where we'd simply require that both sides have matching
> fields and values?  ie.
>
>   "vendor_fields": [
>     { "unknown_field0": "unknown_value0" },
>     { "unknown_field1": "unknown_value1" },
>   ]
>

Since the placement support traits (labels, tags), so the placement just to
matching those fields, so it isn't problem of openstack, since openstack
needn't to know the meaning of those fields. But the traits is just a
label, it isn't key-value format. But also if we have to, we can code this
scheduler filter by python code. But the same thing as above, the invalid
host can't be filtered out in the first step placement service filtering.


> We could certainly make that part of the spec, but I can't really
> figure the value of it other than to severely restrict compatibility,
> which the vendor could already do via the version.major value.  Maybe
> they'd want to put a build timestamp, random uuid, or source sha1 into
> such a field to make absolutely certain compatibility is only determined
> between identical builds?  Thanks,
>
> Alex
>
>

--0000000000000a2d9205aa75ff0b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Alex Williamson &lt;<a href=3D"mailto=
:alex.williamson@redhat.com">alex.williamson@redhat.com</a>&gt; =E4=BA=8E20=
20=E5=B9=B47=E6=9C=8815=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8A=E5=8D=885:00=
=E5=86=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Tue, 14 Jul 2020 18:19:46 +0100<br>
&quot;Dr. David Alan Gilbert&quot; &lt;<a href=3D"mailto:dgilbert@redhat.co=
m" target=3D"_blank">dgilbert@redhat.com</a>&gt; wrote:<br>
<br>
&gt; * Alex Williamson (<a href=3D"mailto:alex.williamson@redhat.com" targe=
t=3D"_blank">alex.williamson@redhat.com</a>) wrote:<br>
&gt; &gt; On Tue, 14 Jul 2020 11:21:29 +0100<br>
&gt; &gt; Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com=
" target=3D"_blank">berrange@redhat.com</a>&gt; wrote:<br>
&gt; &gt;=C2=A0 =C2=A0<br>
&gt; &gt; &gt; On Tue, Jul 14, 2020 at 07:29:57AM +0800, Yan Zhao wrote:=C2=
=A0 <br>
&gt; &gt; &gt; &gt; hi folks,<br>
&gt; &gt; &gt; &gt; we are defining a device migration compatibility interf=
ace that helps upper<br>
&gt; &gt; &gt; &gt; layer stack like openstack/ovirt/libvirt to check if tw=
o devices are<br>
&gt; &gt; &gt; &gt; live migration compatible.<br>
&gt; &gt; &gt; &gt; The &quot;devices&quot; here could be MDEVs, physical d=
evices, or hybrid of the two.<br>
&gt; &gt; &gt; &gt; e.g. we could use it to check whether<br>
&gt; &gt; &gt; &gt; - a src MDEV can migrate to a target MDEV,<br>
&gt; &gt; &gt; &gt; - a src VF in SRIOV can migrate to a target VF in SRIOV=
,<br>
&gt; &gt; &gt; &gt; - a src MDEV can migration to a target VF in SRIOV.<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0(e.g. SIOV/SRIOV backward compatibility cas=
e)<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; The upper layer stack could use this interface as the l=
ast step to check<br>
&gt; &gt; &gt; &gt; if one device is able to migrate to another device befo=
re triggering a real<br>
&gt; &gt; &gt; &gt; live migration procedure.<br>
&gt; &gt; &gt; &gt; we are not sure if this interface is of value or help t=
o you. please don&#39;t<br>
&gt; &gt; &gt; &gt; hesitate to drop your valuable comments.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; (1) interface definition<br>
&gt; &gt; &gt; &gt; The interface is defined in below way:<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __=C2=
=A0 =C2=A0 userspace<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/=
\=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\write<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/ read=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 ________/__________=C2=A0 =C2=A0 =C2=A0 =
=C2=A0___\|/_____________<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0| migration_version |=C2=A0 =C2=A0 =C2=A0| =
migration_version |--&gt;check migration<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0---------------------=C2=A0 =C2=A0 =C2=A0--=
-------------------=C2=A0 =C2=A0compatibility<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 device A=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 device B<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; a device attribute named migration_version is defined u=
nder each device&#39;s<br>
&gt; &gt; &gt; &gt; sysfs node. e.g. (/sys/bus/pci/devices/0000\:00\:02.0/$=
mdev_UUID/migration_version).<br>
&gt; &gt; &gt; &gt; userspace tools read the migration_version as a string =
from the source device,<br>
&gt; &gt; &gt; &gt; and write it to the migration_version sysfs attribute i=
n the target device.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; The userspace should treat ANY of below conditions as t=
wo devices not compatible:<br>
&gt; &gt; &gt; &gt; - any one of the two devices does not have a migration_=
version attribute<br>
&gt; &gt; &gt; &gt; - error when reading from migration_version attribute o=
f one device<br>
&gt; &gt; &gt; &gt; - error when writing migration_version string of one de=
vice to<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0migration_version attribute of the other de=
vice<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; The string read from migration_version attribute is def=
ined by device vendor<br>
&gt; &gt; &gt; &gt; driver and is completely opaque to the userspace.<br>
&gt; &gt; &gt; &gt; for a Intel vGPU, string format can be defined like<br>
&gt; &gt; &gt; &gt; &quot;parent device PCI ID&quot; + &quot;version of gvt=
 driver&quot; + &quot;mdev type&quot; + &quot;aggregator count&quot;.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; for an NVMe VF connecting to a remote storage. it could=
 be<br>
&gt; &gt; &gt; &gt; &quot;PCI ID&quot; + &quot;driver version&quot; + &quot=
;configured remote storage URL&quot;<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; for a QAT VF, it may be<br>
&gt; &gt; &gt; &gt; &quot;PCI ID&quot; + &quot;driver version&quot; + &quot=
;supported encryption set&quot;.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; (to avoid namespace confliction from each vendor, we ma=
y prefix a driver name to<br>
&gt; &gt; &gt; &gt; each migration_version string. e.g. i915-v1-8086-591d-i=
915-GVTg_V5_8-1)=C2=A0 <br>
&gt; &gt; <br>
&gt; &gt; It&#39;s very strange to define it as opaque and then proceed to =
describe<br>
&gt; &gt; the contents of that opaque string.=C2=A0 The point is that its c=
ontents<br>
&gt; &gt; are defined by the vendor driver to describe the device, driver v=
ersion,<br>
&gt; &gt; and possibly metadata about the configuration of the device.=C2=
=A0 One<br>
&gt; &gt; instance of a device might generate a different string from anoth=
er.<br>
&gt; &gt; The string that a device produces is not necessarily the only str=
ing<br>
&gt; &gt; the vendor driver will accept, for example the driver might suppo=
rt<br>
&gt; &gt; backwards compatible migrations.=C2=A0 <br>
&gt; <br>
&gt; (As I&#39;ve said in the previous discussion, off one of the patch ser=
ies)<br>
&gt; <br>
&gt; My view is it makes sense to have a half-way house on the opaqueness o=
f<br>
&gt; this string; I&#39;d expect to have an ID and version that are human<b=
r>
&gt; readable, maybe a device ID/name that&#39;s human interpretable and th=
en a<br>
&gt; bunch of other cruft that maybe device/vendor/version specific.<br>
&gt; <br>
&gt; I&#39;m thinking that we want to be able to report problems and includ=
e the<br>
&gt; string and the user to be able to easily identify the device that was<=
br>
&gt; complaining and notice a difference in versions, and perhaps also use<=
br>
&gt; it in compatibility patterns to find compatible hosts; but that does<b=
r>
&gt; get tricky when it&#39;s a &#39;ask the device if it&#39;s compatible&=
#39;.<br>
<br>
In the reply I just sent to Dan, I gave this example of what a<br>
&quot;compatibility string&quot; might look like represented as json:<br>
<br>
{<br>
=C2=A0 &quot;device_api&quot;: &quot;vfio-pci&quot;,<br>
=C2=A0 &quot;vendor&quot;: &quot;vendor-driver-name&quot;,<br>
=C2=A0 &quot;version&quot;: {<br>
=C2=A0 =C2=A0 &quot;major&quot;: 0,<br>
=C2=A0 =C2=A0 &quot;minor&quot;: 1<br>
=C2=A0 },<br></blockquote><div><br></div><div>The OpenStack Placement servi=
ce doesn&#39;t support to filtering the target host by the semver syntax, a=
ltough we can code this filtering logic inside scheduler filtering by pytho=
n code. Basically, placement only supports filtering the host by traits (it=
 is same thing with labels, tags). The nova scheduler will call the placeme=
nt service to filter the hosts first, then go through all the scheduler fil=
ters. That would be great if the placement service can filter out more host=
s which isn&#39;t compatible first, and then it is better.</div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 &quot;vfio-pci&quot;: { // Based on above device_api<br>
=C2=A0 =C2=A0 &quot;vendor&quot;: 0x1234, // Values for the exposed device<=
br>
=C2=A0 =C2=A0 &quot;device&quot;: 0x5678,<br>
=C2=A0 =C2=A0 =C2=A0 // Possibly further parameters for a more specific mat=
ch<br>
=C2=A0 },<br></blockquote><div><br></div><div>OpenStack already based on ve=
ndor and device id to separate the devices into the different resource pool=
, then the scheduler based on that to filer the hosts, so I think it needn&=
#39;t be the part of this compatibility string.</div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 &quot;mdev_attrs&quot;: [<br>
=C2=A0 =C2=A0 { &quot;attribute0&quot;: &quot;VALUE&quot; }<br>
=C2=A0 ]<br>
}<br>
<br>
Are you thinking that we might allow the vendor to include a vendor<br>
specific array where we&#39;d simply require that both sides have matching<=
br>
fields and values?=C2=A0 ie.<br>
<br>
=C2=A0 &quot;vendor_fields&quot;: [<br>
=C2=A0 =C2=A0 { &quot;unknown_field0&quot;: &quot;unknown_value0&quot; },<b=
r>
=C2=A0 =C2=A0 { &quot;unknown_field1&quot;: &quot;unknown_value1&quot; },<b=
r>
=C2=A0 ]<br></blockquote><div><br></div><div>Since the placement support tr=
aits (labels, tags), so the placement just to matching those fields, so it =
isn&#39;t problem of openstack, since openstack needn&#39;t to know the mea=
ning of those fields. But the traits is just a label, it isn&#39;t key-valu=
e format. But also if we have to, we can code this scheduler filter by pyth=
on code. But the same thing as above, the invalid host can&#39;t be filtere=
d out in the first step placement service filtering.</div><div><br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
We could certainly make that part of the spec, but I can&#39;t really<br>
figure the value of it other than to severely restrict compatibility,<br>
which the vendor could already do via the version.major value.=C2=A0 Maybe<=
br>
they&#39;d want to put a build timestamp, random uuid, or source sha1 into<=
br>
such a field to make absolutely certain compatibility is only determined<br=
>
between identical builds?=C2=A0 Thanks,<br>
<br>
Alex<br>
<br>
</blockquote></div></div>

--0000000000000a2d9205aa75ff0b--

--===============0204143267==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0204143267==--
