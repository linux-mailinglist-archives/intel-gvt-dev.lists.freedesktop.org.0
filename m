Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C5D68A398
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  3 Feb 2023 21:35:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D99CE10E0A4;
	Fri,  3 Feb 2023 20:35:14 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4EC010E0A4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  3 Feb 2023 20:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675456512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=viFRJZV2q4SezGlI/FWcxb2WITMhrV1J+/DY3bMPspI=;
 b=VTnyHbok4VDVDp+LMyBQEwc7D632yPHPNgln7ED55pBdX730hRCOqIlRycPmLygfyaYe8h
 ktrQMH8mslecXZaGp1z2TO/QdEZURmqJKdMcVfqdV8uAx8uNGTshun5//tmp3aloE0LgGB
 33kKTfmApVQFLDd4pG8cwy83bLfcvQQ=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-214-nU59Ht_sPoSm6PTWQLVgoQ-1; Fri, 03 Feb 2023 15:35:08 -0500
X-MC-Unique: nU59Ht_sPoSm6PTWQLVgoQ-1
Received: by mail-il1-f199.google.com with SMTP id
 s12-20020a056e021a0c00b0030efd0ed890so4002720ild.7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 03 Feb 2023 12:35:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JitJ+EzQFI4tRE7oSO6h0RzqVsLIaAm1WlJEalphUB8=;
 b=em3IM7ayZ44zxay6I3rshyxUMwxjVbPRlqrUsXtn1M7mhtzIrHseTFtPMaLYmmCvEL
 ZEPUDYSvfQVwvg5++QhSIGD0qmrSlWD8TjDPFfu43vmkUWok/jnkOkN2oKNyIy93YkDn
 x5QfQgLxT0OlkOnCCmI35mHdDXwuRVFuO+3T36mP+o3O3w+tBOvoINJTxD/uacVyHYdq
 GB89EEKB9rwtb9m+t8c7JmrtQ2T1kypId6VxgSdrPGRLUi1rVmeEf1EF1bMByrGrPsJq
 er4N5RWQ5d8TGHy6nQEEtyAeZ9CNvzw/8ehXGY0M3tC3kp0FKhaRCkTKE7XAj1addeJd
 a+6Q==
X-Gm-Message-State: AO0yUKWGy1TXaNIAkvvg1MtfGHd9DTxInkhzyHJeQZgQDezXFqB0paxW
 hsatpJVnmetSGOd4KAIlGQdvWVkygwURTOCbJxzLkHsNETZoHpXEM8Xafs+klEO+6YitVqSVBCV
 A4dppPjqbadNLMkbYxnkv+nwZZcXdoPF+JA==
X-Received: by 2002:a05:6e02:2194:b0:310:be24:260a with SMTP id
 j20-20020a056e02219400b00310be24260amr9908892ila.30.1675456507687; 
 Fri, 03 Feb 2023 12:35:07 -0800 (PST)
X-Google-Smtp-Source: AK7set9GIBfAjhIj5v0BQS/LjNDFZ4r0AnKB0rNTkxdvIO9fwIpXafr9OOmCRq/tq2BYChRorlbGeA==
X-Received: by 2002:a05:6e02:2194:b0:310:be24:260a with SMTP id
 j20-20020a056e02219400b00310be24260amr9908859ila.30.1675456507248; 
 Fri, 03 Feb 2023 12:35:07 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 d71-20020a0285cd000000b003b02df3521dsm1128406jai.93.2023.02.03.12.35.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 12:35:06 -0800 (PST)
Date: Fri, 3 Feb 2023 13:35:03 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>
Subject: Re: [PATCH v3] vfio: fix deadlock between group lock and kvm lock
Message-ID: <20230203133503.4d8fb3e8.alex.williamson@redhat.com>
In-Reply-To: <ed030aa5-b3af-638e-6e26-4e3a20b98ef4@linux.ibm.com>
References: <20230202162442.78216-1-mjrosato@linux.ibm.com>
 <20230202124210.476adaf8.alex.williamson@redhat.com>
 <BN9PR11MB527618E281BEB8E479ABB0418CD69@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20230202161307.0c6aa23e.alex.williamson@redhat.com>
 <BN9PR11MB5276017F9CEBB4BAE58C40E88CD79@BN9PR11MB5276.namprd11.prod.outlook.com>
 <DS0PR11MB7529050661FCE4A5AC4B17C3C3D79@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230203064940.435e4d65.alex.williamson@redhat.com>
 <DS0PR11MB75297154376388A3698C5CCAC3D79@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230203081942.64fbf9f1.alex.williamson@redhat.com>
 <ed030aa5-b3af-638e-6e26-4e3a20b98ef4@linux.ibm.com>
Organization: Red Hat
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
 "david@redhat.com" <david@redhat.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, "jjherne@linux.ibm.com" <jjherne@linux.ibm.com>,
 "Tian, Kevin" <kevin.tian@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "pmorel@linux.ibm.com" <pmorel@linux.ibm.com>, "Christopherson, ,
 Sean" <seanjc@google.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Fri, 3 Feb 2023 12:29:01 -0500
Matthew Rosato <mjrosato@linux.ibm.com> wrote:

> On 2/3/23 10:19 AM, Alex Williamson wrote:
> > On Fri, 3 Feb 2023 14:54:44 +0000
> > "Liu, Yi L" <yi.l.liu@intel.com> wrote:
> >  =20
> >>> From: Alex Williamson <alex.williamson@redhat.com>
> >>> Sent: Friday, February 3, 2023 9:50 PM
> >>>
> >>> On Fri, 3 Feb 2023 13:32:09 +0000
> >>> "Liu, Yi L" <yi.l.liu@intel.com> wrote:
> >>>    =20
> >>>>> From: Tian, Kevin <kevin.tian@intel.com>
> >>>>> Sent: Friday, February 3, 2023 10:00 AM
> >>>>>   =20
> >>>>>> From: Alex Williamson <alex.williamson@redhat.com>
> >>>>>> Sent: Friday, February 3, 2023 7:13 AM
> >>>>>>
> >>>>>> On Thu, 2 Feb 2023 23:04:10 +0000
> >>>>>> "Tian, Kevin" <kevin.tian@intel.com> wrote:
> >>>>>>   =20
> >>>>>>>> From: Alex Williamson <alex.williamson@redhat.com>
> >>>>>>>> Sent: Friday, February 3, 2023 3:42 AM
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> LGTM.  I'm not sure moving the functions to vfio_main really buy=
s   =20
> >>> us   =20
> >>>>>>>> anything since we're making so much use of group fields.  The cd=
ev
> >>>>>>>> approach will necessarily be different, so the bulk of the get c=
ode   =20
> >>> will   =20
> >>>>>>>> likely need to move back to group.c anyway.
> >>>>>>>>   =20
> >>>>>>>
> >>>>>>> well my last comment was based on Matthew's v2 where the get   =
=20
> >>> code   =20
> >>>>>>> gets a kvm passed in instead of implicitly retrieving group ref_l=
ock
> >>>>>>> internally. In that case the get/put helpers only contain device =
logic
> >>>>>>> thus fit in vfio_main.c.
> >>>>>>>
> >>>>>>> with v3 then they have to be in group.c since we don't want to us=
e
> >>>>>>> group fields in vfio_main.c.
> >>>>>>>
> >>>>>>> but I still think v2 of the helpers is slightly better. The only =
difference
> >>>>>>> between cdev and group when handling this race is using different
> >>>>>>> ref_lock. the symbol get/put part is exactly same. So even if we
> >>>>>>> merge v3 like this, very likely Yi has to change it back to v2 st=
yle
> >>>>>>> to share the get/put helpers while just leaving the ref_lock part
> >>>>>>> handled differently between the two path.   =20
> >>>>>>
> >>>>>> I'm not really a fan of the asymmetry of the v2 version where the =
get
> >>>>>> helper needs to be called under the new kvm_ref_lock, but the put
> >>>>>> helper does not.  Having the get helper handle that makes the call=
er
> >>>>>> much cleaner.  Thanks,
> >>>>>>   =20
> >>>>>
> >>>>> What about passing the lock pointer into the helper? it's still sli=
ghtly
> >>>>> asymmetry as the put helper doesn't carry the lock pointer but it
> >>>>> could also be interpreted as if the pointer has been saved in the g=
et
> >>>>> then if it needs to be referenced by the put there is no need to pa=
ss
> >>>>> it in again.   =20
> >>>>
> >>>> For cdev, I may modify vfio_device_get_kvm_safe() to accept
> >>>> struct kvm and let its caller hold a kvm_ref_lock (field within
> >>>> struct vfio_device_file). Meanwhile, the group path holds
> >>>> the group->kvm_ref_lock before invoking vfio_device_get_kvm_safe().
> >>>> vfio_device_get_kvm_safe() just includes the symbol get/put and
> >>>> the device->kvm and put_kvm set.   =20
> >>>
> >>> Sounds a lot like v2 :-\    =20
> >>
> >> Yes, like v2. =F0=9F=98=8A
> >> =20
> >>> I'd look more towards group and cdev specific
> >>> helpers that handle the locking so that the callers aren't exposed to
> >>> the asymmetry of get vs put, and reduce a new
> >>> _vfio_device_get_kvm_safe() in common code that only does the symbol
> >>> work.  Thanks,   =20
> >>
> >> If so, looks like Matthew needs a v4. I'm waiting for the final versio=
n
> >> of this patch and sending a new cdev series based on it. wish to see
> >> it soon ^_^. =20
> >=20
> > cdev support is a future feature, why does it become a requirement for
> > a fix to the current base?  The refactoring could also happen in the
> > cdev series.  Thanks,
> >=20
> > Alex
> >  =20
>=20
> FWIW, that would bloat the fix by a bit and it's already a decent-sized f=
ix...  I took a quick stab and such a v4 would end up with a total of 120 i=
nsertions(+), 15 deletions(-).  See below for a diff of what I tried on top=
 of v3. The idea would be to move the serialization and setting/clearing of=
 device->kvm into group/cdev and use device->kvm as the value within vfio_d=
evice_get_kvm_safe for getting the kvm ref.  Wrappers in group/cdev would t=
hen be responsible for backing that device->kvm setting out on ref failure.
> Each side (group/cdev) can wrap their own serialization / load device->kv=
m from the appropriate location / handle the failed get / clear device->kvm=
 when done (since get doesn't set it, put shouldn't clear it).
>=20
> If Alex wants, I can wrap something like this into a v4 -- Or, if we don'=
t want to include this kind of infrastructure in the fix, then Yi please fe=
el free to use it as a starting point for what you need in cdev.
>=20
> Thanks,
> Matt
>=20
> diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
> index 7fed4233ca23..261af23975ae 100644
> --- a/drivers/vfio/group.c
> +++ b/drivers/vfio/group.c
> @@ -154,6 +154,31 @@ static int vfio_group_ioctl_set_container(struct vfi=
o_group *group,
>  =09return ret;
>  }
> =20
> +static void vfio_device_group_get_kvm(struct vfio_device *device)
> +{
> +=09lockdep_assert_held(&device->dev_set->lock);
> +
> +=09spin_lock(&device->group->kvm_ref_lock);
> +
> +=09if (!device->group->kvm)
> +=09=09goto unlock;
> +
> +=09device->kvm =3D device->group->kvm;
> +=09if (!vfio_device_get_kvm_safe(device))

I'd probably go back to making this:

void _vfio_device_get_kvm_safe(struct vfio_device *device, struct kvm *kvm)=
;

so the vfio_main function would handle setting and clearing
device->kvm.  That way we could also move the lockdep into the
vfio_main functions.  Once we do that, there's no reason to have a
group vs cdev put function and we end up with only a wrapper on the get
function, which should really never be used directly, so we prefix it
with an underscore.

At that point (see incremental diff below), it's about a wash.  Current v3:

 drivers/vfio/group.c     |   32 +++++++++++++----
 drivers/vfio/vfio.h      |   14 +++++++
 drivers/vfio/vfio_main.c |   70 +++++++++++++++++++++++++++++++++++----
 include/linux/vfio.h     |    2 -
 4 files changed, 103 insertions(+), 15 deletions(-)

Folding in below:

 drivers/vfio/group.c     |   44 ++++++++++++++++++++++-----
 drivers/vfio/vfio.h      |   15 +++++++++
 drivers/vfio/vfio_main.c |   63 ++++++++++++++++++++++++++++++++++-----
 include/linux/vfio.h     |    2 -
 4 files changed, 109 insertions(+), 15 deletions(-)

Unfortunately it seems I've talked myself into the answer that we
should maybe just pre-enable cdev by not adding a group reference in
vfio_main.  Thanks,

Alex

diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
index 7fed4233ca23..98621ac082f0 100644
--- a/drivers/vfio/group.c
+++ b/drivers/vfio/group.c
@@ -154,6 +154,18 @@ static int vfio_group_ioctl_set_container(struct vfio_=
group *group,
 =09return ret;
 }
=20
+static void vfio_device_group_get_kvm_safe(struct vfio_device *device)
+{
+=09spin_lock(&device->group->kvm_ref_lock);
+=09if (!device->group->kvm)
+=09=09goto unlock;
+
+=09_vfio_device_get_kvm_safe(device, device->group->kvm);
+
+unlock:
+=09spin_unlock(&device->group->kvm_ref_lock);
+}
+
 static int vfio_device_group_open(struct vfio_device *device)
 {
 =09int ret;
@@ -173,7 +185,7 @@ static int vfio_device_group_open(struct vfio_device *d=
evice)
 =09 * the pointer in the device for use by drivers.
 =09 */
 =09if (device->open_count =3D=3D 0)
-=09=09vfio_device_get_kvm_safe(device);
+=09=09vfio_device_group_get_kvm_safe(device);
=20
 =09ret =3D vfio_device_open(device, device->group->iommufd, device->kvm);
=20
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index 20d715b0a3a8..24d6cd285945 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -253,10 +253,11 @@ enum { vfio_noiommu =3D false };
 #endif
=20
 #ifdef CONFIG_HAVE_KVM
-void vfio_device_get_kvm_safe(struct vfio_device *device);
+void _vfio_device_get_kvm_safe(struct vfio_device *device, struct kvm *kvm=
);
 void vfio_device_put_kvm(struct vfio_device *device);
 #else
-static inline void vfio_device_get_kvm_safe(struct vfio_device *device)
+static inline void _vfio_device_get_kvm_safe(struct vfio_device *device,
+=09=09=09=09=09     struct kvm *kvm)
 {
 }
=20
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 4762550e9f42..00d4d5167d6c 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -342,7 +342,7 @@ void vfio_unregister_group_dev(struct vfio_device *devi=
ce)
 EXPORT_SYMBOL_GPL(vfio_unregister_group_dev);
=20
 #ifdef CONFIG_HAVE_KVM
-void vfio_device_get_kvm_safe(struct vfio_device *device)
+void _vfio_device_get_kvm_safe(struct vfio_device *device, struct kvm *kvm=
)
 {
 =09void (*pfn)(struct kvm *kvm);
 =09bool (*fn)(struct kvm *kvm);
@@ -350,32 +350,25 @@ void vfio_device_get_kvm_safe(struct vfio_device *dev=
ice)
=20
 =09lockdep_assert_held(&device->dev_set->lock);
=20
-=09spin_lock(&device->group->kvm_ref_lock);
-=09if (!device->group->kvm)
-=09=09goto unlock;
-
 =09pfn =3D symbol_get(kvm_put_kvm);
 =09if (WARN_ON(!pfn))
-=09=09goto unlock;
+=09=09return;
=20
 =09fn =3D symbol_get(kvm_get_kvm_safe);
 =09if (WARN_ON(!fn)) {
 =09=09symbol_put(kvm_put_kvm);
-=09=09goto unlock;
+=09=09return;
 =09}
=20
 =09ret =3D fn(device->group->kvm);
 =09symbol_put(kvm_get_kvm_safe);
 =09if (!ret) {
 =09=09symbol_put(kvm_put_kvm);
-=09=09goto unlock;
+=09=09return;
 =09}
=20
 =09device->put_kvm =3D pfn;
-=09device->kvm =3D device->group->kvm;
-
-unlock:
-=09spin_unlock(&device->group->kvm_ref_lock);
+=09device->kvm =3D kvm;
 }
=20
 void vfio_device_put_kvm(struct vfio_device *device)

