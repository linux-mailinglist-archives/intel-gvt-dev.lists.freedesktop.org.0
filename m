Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A12D6DAA7B
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  7 Apr 2023 10:56:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E922910E00D;
	Fri,  7 Apr 2023 08:56:51 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC02310E00D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  7 Apr 2023 08:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680857809;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zm0x3qIRJGoq5IUNwNsG2TAdBWo5E6P2pw0Wr6/J6xU=;
 b=gygHWpzhklOzFnKD2IAqbEvcPu/wmXcsY6RjNw7KZ6n1TKSbjkVM01qLU5eubMXzPsgrVz
 T1ykgFfAFMeIjuVQ61g0J+68oBB7IiMpdKFOv/e1ylpzYo1pClEuVrTWteiNh1GecCeNhx
 iB1sQqaxoIFOCgxc9Jbh3PaQHwD7cMs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-De53GU-KM12Sv1rj3GZc6g-1; Fri, 07 Apr 2023 04:56:47 -0400
X-MC-Unique: De53GU-KM12Sv1rj3GZc6g-1
Received: by mail-wm1-f69.google.com with SMTP id
 iv10-20020a05600c548a00b003ee112e6df1so19514774wmb.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 07 Apr 2023 01:56:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680857806;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zm0x3qIRJGoq5IUNwNsG2TAdBWo5E6P2pw0Wr6/J6xU=;
 b=hqUHQQ1LjEKmJM89b38hpbrojO7CUUEyOSDzS6cJ7b6EGb/6ISSlzGu+ZqHCB1Yspm
 j9stqHDlGggQ4jkDdktacEwhJi1x+y/IhgSfgAUvuz/XmHoWjbwXy4B//BvZbDMUg9Jo
 7Cn2uX0cdpSEJFeN9u2ly1QodTov/sQQmFizss1FKKVD7XH8f00t+Zuw7roVWf6/ZvnI
 /t8ETRPcNap99s+ZUS6LrXoOrB7fyAMS/6Wk+hb4UYji38kWb4N+IWDvENfjlqNXvhmO
 l+781QIkx8lxgPaapzYItoRF8VXFWdSt7k22apusONxIGz4sQJtZYjTq/gxbuywmupOW
 Bu2w==
X-Gm-Message-State: AAQBX9dxAAmkoV/NTXnd0hUk1KoN9zIQ62Y6WY6Iv6Mg5VtSC9rzpth9
 8KDSpRQ8LIG1XlaqTMqqn9kO1kgJ7+cZiS5nbfca3zOGL3H7Q6+ZkL31E+onW9ZejJPfaNN08su
 WW99PAMANZXtd8212wp2WlacF/B0m9VUXzg==
X-Received: by 2002:a05:600c:4f45:b0:3ee:93d2:c915 with SMTP id
 m5-20020a05600c4f4500b003ee93d2c915mr915236wmq.6.1680857806782; 
 Fri, 07 Apr 2023 01:56:46 -0700 (PDT)
X-Google-Smtp-Source: AKy350bKstcvpy21T/+Sur+wGdRQ6MZEvGuCCMZJzNceYWbo9B1mTkijQltP94h5JEaS1eDfNwFqwg==
X-Received: by 2002:a05:600c:4f45:b0:3ee:93d2:c915 with SMTP id
 m5-20020a05600c4f4500b003ee93d2c915mr915208wmq.6.1680857806468; 
 Fri, 07 Apr 2023 01:56:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a05600c450600b003ee2a0d49dbsm7785542wmo.25.2023.04.07.01.56.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 01:56:45 -0700 (PDT)
Message-ID: <5f8d9e23-8a4c-3f97-8f22-01eaa4eddfbb@redhat.com>
Date: Fri, 7 Apr 2023 10:56:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v9 06/25] kvm/vfio: Accept vfio device file from userspace
To: "Liu, Yi L" <yi.l.liu@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>
References: <20230401151833.124749-1-yi.l.liu@intel.com>
 <20230401151833.124749-7-yi.l.liu@intel.com>
 <8fb5a0b3-39c6-e924-847d-6545fcc44c08@redhat.com>
 <DS0PR11MB7529B8DC835A6EADDB815C04C3919@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230406125730.55bfa666.alex.williamson@redhat.com>
 <DS0PR11MB752903283C1E02708EC13848C3969@DS0PR11MB7529.namprd11.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <DS0PR11MB752903283C1E02708EC13848C3969@DS0PR11MB7529.namprd11.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Reply-To: eric.auger@redhat.com
Cc: "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>, "Hao,
 Xudong" <xudong.hao@intel.com>, "peterx@redhat.com" <peterx@redhat.com>, "Xu,
 Terrence" <terrence.xu@intel.com>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "lulu@redhat.com" <lulu@redhat.com>, "Jiang,
 Yanting" <yanting.jiang@intel.com>, "joro@8bytes.org" <joro@8bytes.org>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "Tian, Kevin" <kevin.tian@intel.com>, "Zhao, Yan Y" <yan.y.zhao@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hi Yi,

On 4/7/23 05:42, Liu, Yi L wrote:
>> From: Alex Williamson <alex.williamson@redhat.com>
>> Sent: Friday, April 7, 2023 2:58 AM
>>>> You don't say anything about potential restriction, ie. what if the user calls
>>>> KVM_DEV_VFIO_FILE with device fds while it has been using legacy
>> container/group
>>>> API?
>>> legacy container/group path cannot do it as the below enhancement.
>>> User needs to call KVM_DEV_VFIO_FILE before open devices, so this
>>> should happen before _GET_DEVICE_FD. So the legacy path can never
>>> pass device fds in KVM_DEV_VFIO_FILE.
>>>
>>>
>> https://lore.kernel.org/kvm/20230327102059.333d6976.alex.williamson@redhat.com
>> /#t
>>
>> Wait, are you suggesting that a comment in the documentation suggesting
>> a usage policy somehow provides enforcement of that ordering??  That's
>> not how this works.  Thanks,
> I don't know if there is a good way to enforce this order in the code. The
> vfio_device->kvm pointer is optional. If it is NULL, vfio just ignores it.
> So vfio doesn't have a good way to tell if the order requirement is met or
> not. Perhaps just trigger NULL pointer dereference when kvm pointer is used
> in the device drivers like kvmgt if this order is not met.
>
> So that's why I come up to document it here. The applications uses kvm
> should know this and follow this otherwise it may encounter error.
>
> Do you have other suggestions for it? This order should be a generic
> requirement. is it? group path also needs to follow it to make the mdev
> driver that refers kvm pointer to be workable.

In the same way as kvm_vfio_file_is_valid() called in kvm_vfio_file_add()
can't you have a kernel API that checks the fd consistence?

Thanks

Eric
>
> Thanks,
> Yi Liu
>
>>>>> -The GROUP_ADD operation above should be invoked prior to accessing the
>>>>> +The FILE/GROUP_ADD operation above should be invoked prior to accessing the
>>>>>  device file descriptor via VFIO_GROUP_GET_DEVICE_FD in order to support
>>>>>  drivers which require a kvm pointer to be set in their .open_device()
>>>>> -callback.
>>>>> +callback.  It is the same for device file descriptor via character device
>>>>> +open which gets device access via VFIO_DEVICE_BIND_IOMMUFD.  For such file
>>>>> +descriptors, FILE_ADD should be invoked before
>> VFIO_DEVICE_BIND_IOMMUFD
>>>>> +to support the drivers mentioned in prior sentence as well.
>>> just as here. This means device fds can only be passed with KVM_DEV_VFIO_FILE
>>> in the cdev path.
>>>
>>> Regards,
>>> Yi Liu

