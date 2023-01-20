Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6478367590D
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 20 Jan 2023 16:49:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3616710E012;
	Fri, 20 Jan 2023 15:49:45 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE2910E012
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 20 Jan 2023 15:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674229782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aavit6jM1lC6qQPOxTCnu44ZFH15mB1QS8MkjGvi8Yk=;
 b=D2XIAM6Yqk/6md88db9VGXY8ng0dmF+ea4dy5EuE/PBLaY3/LJft0tq7uNJjx1Qk9naXHO
 yLQxgeFTF9NV/ljqQs/rVb1DV55hd4koJw+8Hide9fuwPLdhHsTvGJCEHisX2DuZTVKeC6
 vD3/tw/yDY5mL/S21Oegu/tr+8e75PM=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-96-2aXf0F2HMGmZeGU8-zMtCw-1; Fri, 20 Jan 2023 10:49:39 -0500
X-MC-Unique: 2aXf0F2HMGmZeGU8-zMtCw-1
Received: by mail-io1-f70.google.com with SMTP id
 z19-20020a056602205300b0070756e30008so3091084iod.15
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 20 Jan 2023 07:49:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aavit6jM1lC6qQPOxTCnu44ZFH15mB1QS8MkjGvi8Yk=;
 b=xCQ9UUPVR1LKUfnUDsrsRaSlYd71swvrtfswMOO3TNGdEMwnV2PbXAHwRGCw5BgTzo
 5gQv5bbYdAg5ZK+gGXlO78aYhZ7XDiuQSGKe07y76Y6Ot9+/RoZlQnLLVWjLutrQ2szy
 0/jJzJNuVrzScyFkM/AbzZeoyA1qH7YQyfZVDHWXHDXjv2o3SNFxmsOQulr3bpAQtjbE
 s4eSjFjFOdeI7L4faSY8lAcTl9gRmAvPYppquAREeSZFd/IxMOkeyGtImN0smfWND/wh
 pe6ol5ewV5y5DjsIXqOXvckRruHpCHbV3kEhY4O8yPoF24JlIWy5F9x+KFm8lcOXMzsJ
 +Gig==
X-Gm-Message-State: AFqh2kpFgspeffodjc0xE/rmlTvVzCVEoHr0GTIWHgeIgITgmljxzRiV
 crJ6JbkSZ1b0YSkAWh5rfU0JZIWUF6uQzLPf5Qc12IT10OrJIcfVirGRvG0yHhGtkJCjSgVaCVD
 m8ed2BqjUetJcZ4HH8pkS1JoB/2UU4Ti4bw==
X-Received: by 2002:a05:6e02:cc6:b0:30f:3dfe:c670 with SMTP id
 c6-20020a056e020cc600b0030f3dfec670mr4626061ilj.25.1674229776953; 
 Fri, 20 Jan 2023 07:49:36 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsF7uAHGgInj7PstAuuh+H1lLdGiBCat5fhmmcQKX6OvgOleEUrY91pvtEjqx5EjFLwygLnnw==
X-Received: by 2002:a05:6e02:cc6:b0:30f:3dfe:c670 with SMTP id
 c6-20020a056e020cc600b0030f3dfec670mr4626033ilj.25.1674229776663; 
 Fri, 20 Jan 2023 07:49:36 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 z18-20020a92d192000000b0030c0217dde6sm851618ilz.0.2023.01.20.07.49.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 07:49:36 -0800 (PST)
Date: Fri, 20 Jan 2023 08:49:33 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>
Subject: Re: [PATCH] kvm/vfio: Fix potential deadlock on vfio group_lock
Message-ID: <20230120084933.40f59c89.alex.williamson@redhat.com>
In-Reply-To: <6eff63d8-d825-aecd-12b5-e8dbf55f4372@linux.ibm.com>
References: <20230120150528.471752-1-yi.l.liu@intel.com>
 <DS0PR11MB7529B08476DF1764F1B6C007C3C59@DS0PR11MB7529.namprd11.prod.outlook.com>
 <6eff63d8-d825-aecd-12b5-e8dbf55f4372@linux.ibm.com>
Organization: Red Hat
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 20 Jan 2023 10:45:40 -0500
Matthew Rosato <mjrosato@linux.ibm.com> wrote:

> On 1/20/23 10:08 AM, Liu, Yi L wrote:
> >> From: Liu, Yi L <yi.l.liu@intel.com>
> >> Sent: Friday, January 20, 2023 11:05 PM
> >>
> >> Currently it is possible that the final put of a KVM reference comes from
> >> vfio during its device close operation.  This occurs while the vfio group
> >> lock is held; however, if the vfio device is still in the kvm device list,
> >> then the following call chain could result in a deadlock:
> >>
> >> VFIO holds group->group_lock/group_rwsem  
> >>   -> kvm_put_kvm
> >>    -> kvm_destroy_vm
> >>     -> kvm_destroy_devices
> >>      -> kvm_vfio_destroy
> >>       -> kvm_vfio_file_set_kvm
> >>        -> vfio_file_set_kvm
> >>         -> try to hold group->group_lock/group_rwsem  
> >>
> >> The key function is the kvm_destroy_devices() which triggers destroy cb
> >> of kvm_device_ops. It calls back to vfio and try to hold group_lock. So
> >> if this path doesn't call back to vfio, this dead lock would be fixed.
> >> Actually, there is a way for it. KVM provides another point to free the
> >> kvm-vfio device which is the point when the device file descriptor is
> >> closed. This can be achieved by providing the release cb instead of the
> >> destroy cb. Also rename kvm_vfio_destroy() to be kvm_vfio_release().
> >>
> >> 	/*
> >> 	 * Destroy is responsible for freeing dev.
> >> 	 *
> >> 	 * Destroy may be called before or after destructors are called
> >> 	 * on emulated I/O regions, depending on whether a reference is
> >> 	 * held by a vcpu or other kvm component that gets destroyed
> >> 	 * after the emulated I/O.
> >> 	 */
> >> 	void (*destroy)(struct kvm_device *dev);
> >>
> >> 	/*
> >> 	 * Release is an alternative method to free the device. It is
> >> 	 * called when the device file descriptor is closed. Once
> >> 	 * release is called, the destroy method will not be called
> >> 	 * anymore as the device is removed from the device list of
> >> 	 * the VM. kvm->lock is held.
> >> 	 */
> >> 	void (*release)(struct kvm_device *dev);
> >>
> >> Fixes: 421cfe6596f6 ("vfio: remove VFIO_GROUP_NOTIFY_SET_KVM")
> >> Reported-by: Alex Williamson <alex.williamson@redhat.com>
> >> Suggested-by: Kevin Tian <kevin.tian@intel.com>
> >> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> >> Signed-off-by: Yi Liu <yi.l.liu@intel.com>  
> > 
> > More background can be found in Mathew's work.
> > https://lore.kernel.org/kvm/20230114000351.115444-1-mjrosato@linux.ibm.com/T/#u
> >   
> 
> Thanks Yi.
> 
> Reviewed-by: Matthew Rosato <mjrosato@linux.ibm.com>
> 
> One small nit:  There is a comment at the very end of
> kvm_vfio_release on the kfree(dev) that still references .destroy,
> this should be updated to .release

I've fixed this locally, s/destroy/release/ in that comment.  Thanks,

Alex

